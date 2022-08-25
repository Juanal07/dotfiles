require("options")
require("keymaps")
require("packer-config")
require("plugins.lsp")
require("plugins.colorscheme")
require("plugins.autopairs")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.which-key")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.neogit")
require("plugins.gitsigns")
require("plugins.comment")

require("editorconfig")
require("colorizer").setup()
require("nvim-web-devicons").setup({
	default = true,
})
-- require('winbar').setup() -- Requires nvim 0.8
