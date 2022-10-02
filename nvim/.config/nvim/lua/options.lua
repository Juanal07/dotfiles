vim.opt.laststatus = 3 -- Solo una status line por window aunque haya mas panes
vim.opt.termguicolors = true -- Needed in st terminal
vim.opt.sts = 2
vim.opt.ts = 2
vim.opt.sw = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showmode = false -- que no ponga insert debajo de insert en la lualine
vim.opt.number = true
vim.opt.relativenumber = true -- always show line relative numbers
vim.opt.numberwidth = 1
vim.opt.wrap = false
vim.opt.encoding = "utf-8"
vim.opt.showmatch = false
vim.opt.errorbells = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", eol = "↲", extends = "…" }
vim.opt.iskeyword:append("-")
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.opt.ls = 0
-- vim.opt.ch = 0

local M = { proseMode = false }
function M.toggleProse()
  M.proseMode = not M.proseMode
  if M.proseMode then
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.columns = 80
    vim.opt.list = true
    vim.opt.listchars = { tab = "→ ", trail = "·", eol = "↲", space = "·", extends = "#" } --ejemplos
    vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
  else
    vim.opt.wrap = false
    vim.opt.linebreak = false
    vim.opt.columns = 181
    vim.opt.list = false
  end
end

return M
