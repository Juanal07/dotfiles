-- DEFAULTS
-- vim.opt.backup = false -- Default = false
-- vim.opt.showcmd = true -- Default = true
-- vim.opt.ruler = true -- Default = true
-- vim.opt.laststatus = 2 -- Default = 2, always display the status bar
-- vim.opt.hidden = true -- Default = true, permite moverme entre buffers sin guardar
-- vim.opt.autoread = true -- Default = true
-- vim.opt.incsearch = true -- Default = true
-- vim.opt.hlsearch = true -- Default = true
vim.opt.timeoutlen = 250 -- Needed for wichkey plugin
vim.opt.termguicolors = true -- Needed in st terminal
vim.opt.tabstop = 2
vim.opt.sts = 2
vim.opt.sw = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = { tab = ">~", trail = "·", extends = "#" }
-- vim.opt.listchars = { tab = ">~", trail = "·", eol = "↲", space = "·", extends = "#" } --ejemplos
vim.opt.showmode = false -- que no ponga insert debajo de insert en la lualine
vim.opt.number = true
vim.opt.relativenumber = true -- always show line relative numbers
vim.opt.mouse = "a"
vim.opt.numberwidth = 1
vim.opt.wrap = false -- don't wrap lines
vim.opt.encoding = "utf-8"
vim.opt.showmatch = true -- Cuando paso por un bracket parpadea el otro
vim.opt.errorbells = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.scrolloff = 8 -- cuando haces scroll deja 8 lineas de margen
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.shortmess:append("c") -- para que no aparezcan mensajes de mas cuando este en completion

vim.cmd([[set iskeyword+=-]]) -- que words como hola-mundo vim las considere 1 sola para borrar por ej
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
