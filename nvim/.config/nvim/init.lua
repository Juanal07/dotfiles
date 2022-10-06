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

require("nvim-highlight-colors").setup({
  render = "background", -- or 'foreground' or 'first_column'
  enable_named_colors = true,
  enable_tailwind = true,
})
require("nvim-web-devicons").setup()
-- require("editorconfig")
