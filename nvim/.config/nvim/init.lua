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

require("colorizer").setup()
require("nvim-web-devicons").setup({
	default = true,
})

-- TODO: make function with mapping for prose mode
-- Config para escribir prosa
-- local function prosa()

-- vim.opt.wrap = true
-- vim.opt.linebreak = true
-- vim.opt.columns = 80
-- vim.opt.listchars = { tab = ">~", trail = "·", eol = "↲", space = "·", extends = "#" } --ejemplos
-- vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
-- vim.opt.wrap = true
-- vim.opt.linebreak = true
-- vim.opt.columns = 80
-- vim.opt.listchars = { tab = ">~", trail = "·", eol = "↲", space = "·", extends = "#" } --ejemplos
-- vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
