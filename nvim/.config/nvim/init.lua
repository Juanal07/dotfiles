require("user.options")
require("user.keymaps")
require("user.packer")
require("user.colorscheme")
require("plugins.nvim-tree")
require("plugins.which-key")
require("plugins.lualine")
require("plugins.nvim-lsp")
require("plugins.treesitter")
require("plugins.format")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.telescope")

require("colorizer").setup()
require("Comment").setup()
require("nvim-web-devicons").setup({
	default = true,
})

vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
