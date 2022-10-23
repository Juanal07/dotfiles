require("options")
require("keymaps")
require("packer-config") --

require("plugins.lsp") --
require("plugins.cmp") --
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.colorscheme")
require("plugins.gitsigns") --
require("plugins.neogit") --

require("fidget").setup()
require("nvim-autopairs").setup()
require("nvim-web-devicons").setup()
require("which-key").setup()
require("Comment").setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
require("nvim-highlight-colors").setup({ enable_tailwind = true })
