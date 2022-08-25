local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.editorconfig_checker,
		formatting.prettier,
		diagnostics.eslint_d,
		formatting.stylua,
		formatting.black,
		--[[ diagnostics.flake8, ]]
	},
	-- Format on save
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			--[[ vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()") ]]
			--[[ vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()") ]]
			--[[ vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()") ]]

			--[[ prettier tailwind plugin force me to use .formatting() because is too slow ]]
			-- vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]])

			vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
		end
	end,
})
