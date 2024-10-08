require("lspconfig.ui.windows").default_options = { border = "rounded" }
require("mason").setup({
	PATH = "append",
	ui = {
		height = 0.8,
		border = "rounded",
	},
})
local servers = {
	"ts_ls",
	"eslint",
	"pyright",
	"lua_ls",
}
require("mason-lspconfig").setup({ ensure_installed = servers, automatic_installation = true })

-- Diagnostic Signs
local signs = {
	{ name = "DiagnosticSignError", text = " " },
	{ name = "DiagnosticSignWarn", text = " " },
	{ name = "DiagnosticSignHint", text = " " },
	{ name = "DiagnosticSignInfo", text = " " },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Diagnostics
local config = {
	virtual_text = true,
	severity_sort = true,
	underline = false,
	float = {
		source = "always",
		border = "rounded",
		header = "",
		-- prefix = "",
	},
}
vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx)
	config = config or {}
	config.focus_id = ctx.method
	if not (result and result.contents) then
		-- vim.notify("No information available")
		return
	end
	local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
	if vim.tbl_isempty(markdown_lines) then
		-- vim.notify('No information available')
		return
	end

	config.border = "rounded"

	return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = function()
	return vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

-- LSP keymaps
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = false }
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gr",
		'<cmd>lua require"telescope.builtin".lsp_references({ includeDeclaration = false })<CR>',
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<S-R>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Mapping conflict with diff view: take changes from all (mine and theirs)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

-- On attach function
local on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	if client.name == "angularls" then -- Fix for double lsp rename in angular
		client.server_capabilities.renameProvider = false
	end
end

local lspconfig = require("lspconfig")
lspconfig.eslint.setup({})
lspconfig.rust_analyzer.setup({})

-- Servers
require("mason-lspconfig").setup_handlers({
	-- Lua
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
			on_attach = on_attach,
		})
	end,
	-- Python
	["pyright"] = function()
		lspconfig.pyright.setup({
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "off",
					},
				},
			},
			on_attach = on_attach,
		})
	end,
	-- Default
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
		})
	end,
})
