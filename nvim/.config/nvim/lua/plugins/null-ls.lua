local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- Editorconfig
		-- diagnostics.editorconfig_checker,

		-- Javascript
		formatting.prettier,
		diagnostics.eslint_d,

		-- Lua
		formatting.stylua,

		-- Python
		formatting.black,
		-- diagnostics.flake8,

		-- C, C++
		-- formatting.clang_format,
	},

	-- Format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
						-- timeout_ms = 2000,
					})
				end,
			})
		end
	end,
})
