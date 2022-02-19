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
-- end
-- vim.api.nvim_set_keymap("n", "<leader>i", prosa, { noremap = true, silent = true })

-- vim.opt.wrap = true
-- vim.opt.linebreak = true
-- vim.opt.columns = 80
-- vim.opt.listchars = { tab = ">~", trail = "·", eol = "↲", space = "·", extends = "#" } --ejemplos
-- vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
