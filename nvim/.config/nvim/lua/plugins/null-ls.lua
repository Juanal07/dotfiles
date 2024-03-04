local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local misspell = (function()
	local h = require("null-ls.helpers")
	local methods = require("null-ls.methods")

	local DIAGNOSTICS = methods.internal.DIAGNOSTICS

	return h.make_builtin({
		name = "misspell",
		meta = {
			url = "https://github.com/client9/misspell",
			description = "Checks commonly misspelled English words in source files.",
		},
		method = DIAGNOSTICS,
		filetypes = {},
		generator_opts = {
			command = "misspell",
			to_stdin = true,
			format = "line",
			on_output = h.diagnostics.from_pattern(
				[[:(%d+):(%d+): (.*)]],
				{ "row", "col", "message" },
				{ diagnostic = { severity = h.diagnostics.severities["information"] }, offsets = { col = 1 } }
			),
		},
		factory = h.generator_factory,
	})
end)()

local async_formatting = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local active_clients = vim.lsp.get_active_clients()
	for _, client in ipairs(active_clients) do
		if client.name == "lua_ls" then
			vim.lsp.buf.format({ bufnr = bufnr })
			return
		end
	end
	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		vim.lsp.util.make_formatting_params({}),
		function(err, res, ctx)
			if err then
				local err_msg = type(err) == "string" and err or err.message
				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
				return
			end
			if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
				return
			end
			if res then
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("silent noautocmd update")
				end)
			end
		end
	)
end

local sync_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	debug = false,
	sources = {
		-- Spellchecking
		misspell,

		-- Editorconfig
		-- diagnostics.editorconfig_checker,

		-- JS/TS
		formatting.prettier,
		-- diagnostics.eslint_d,

		-- Lua
		formatting.stylua,

		-- Python
		formatting.black,
		-- diagnostics.flake8,

		-- Rust
		-- formatting.rustfmt,

		-- Bash
		-- formatting.beautysh,
		-- formatting.shfmt,

		-- C, C++
		-- formatting.clang_format,
	},
	-- Format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					async_formatting(bufnr)
					-- sync_formatting(bufnr)
				end,
			})
		end
	end,
})
