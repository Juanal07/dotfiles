require("user.options")
require("user.keymaps")
require("user.packer")
require("user.colorscheme")
require("user.lsp")
require("user.autopairs")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.which-key")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.format")
require("plugins.neogit")

require("colorizer").setup()
require("Comment").setup()
require("nvim-web-devicons").setup({
	default = true,
})

vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
