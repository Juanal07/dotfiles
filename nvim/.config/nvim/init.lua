require("options")
require("keymaps")
require("packer-config")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.colorscheme")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.autopairs")
require("plugins.neogit")
require("plugins.gitsigns")

require("nvim-web-devicons").setup()
require("which-key").setup()
require("Comment").setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
require("nvim-highlight-colors").setup({
  render = "background", -- or 'foreground' or 'first_column'
  enable_named_colors = true,
  enable_tailwind = true,
})
