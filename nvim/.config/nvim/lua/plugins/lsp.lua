-- vim
require("lspconfig").vimls.setup({})
-- java
require("lspconfig").java_language_server.setup({})
-- c,c++, etc.
require("lspconfig").sourcekit.setup({})
-- Python
require("lspconfig").pyright.setup({})
-- TS JS
require("lspconfig").tsserver.setup({})
-- Bash
require("lspconfig").bashls.setup({})
-- CSS
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").cssls.setup({
	capabilities = capabilities,
})
-- HTML
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").html.setup({
	capabilities = capabilities,
})
-- JSON
require("lspconfig").jsonls.setup({})
