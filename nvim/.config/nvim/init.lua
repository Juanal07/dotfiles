require("options")
require("keymaps")
require("lazy-config")

require("plugins.lsp")
require("plugins.null-ls")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.ufo")

require("nvim-surround").setup()
require("nvim-autopairs").setup()
require("nvim-web-devicons").setup()
require("nvim-highlight-colors").setup({ enable_tailwind = true })
-- require("Comment").setup()
-- require("ts_context_commentstring").setup({
-- 	enable_autocmd = false,
-- })
-- vim.g.skip_ts_context_commentstring_module = true
