require("options")
require("keymaps")
require("lazy-config")

require("plugins.lsp")
require("plugins.treesitter")
require("plugins.null-ls")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.ufo")
require("plugins.ibl")
require("plugins.neotest")

require("nvim-surround").setup()
require("nvim-autopairs").setup()
require("nvim-web-devicons").setup()
require("nvim-highlight-colors").setup({ enable_tailwind = true })
require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
