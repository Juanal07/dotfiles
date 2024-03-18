require("mason").setup({ PATH = "append" })
local servers = {
	"angularls@17.0.0",
	"pyright",
	"lua_ls",
	"eslint",
	"tsserver",
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

-- local border_config = {
-- 	{ "╭", "FloatBorder" },
-- 	{ "─", "FloatBorder" },
-- 	{ "╮", "FloatBorder" },
-- 	{ "│", "FloatBorder" },
-- 	{ "╯", "FloatBorder" },
-- 	{ "─", "FloatBorder" },
-- 	{ "╰", "FloatBorder" },
-- 	{ "│", "FloatBorder" },
-- }

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
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
	return vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
end

-- LSP keymaps
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = false }
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"ds",
		"<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
		opts
	)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
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
	-- Fix for double lsp rename in angular
	if client.name == "angularls" then
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
					-- runtime = { version = "LuaJIT" },
					-- workspace = {
					-- 	checkTyping = true,
					-- 	library = {
					-- 		"{3rd}/luv/library",
					-- 		unpack(vim.api.nvim_get_runtime_file("", true)),
					-- 	},
					-- },
					-- completion = { callSnippet = "Replace" },
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
