-- DEFAULTS

-- vim.opt.backup = false -- Default = false
-- vim.opt.showcmd = true -- Default = true
-- vim.opt.ruler = true -- Default = true
-- vim.opt.laststatus = 2 -- Default = 2, always display the status bar
-- vim.opt.hidden = true -- Default = true, permite moverme entre buffers sin guardar
-- vim.opt.autoread = true -- Default = true
-- vim.opt.incsearch = true -- Default = true
-- vim.opt.hlsearch = true -- Default = true
-- vim.opt.timeoutlen = 100 -- Default=1000, Needed for wichkey plugin
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
vim.opt.mouse = "a"
vim.opt.numberwidth = 1
vim.opt.wrap = false -- Descomentar cuando no use prosa
vim.opt.encoding = "utf-8"
vim.opt.showmatch = true -- Cuando paso por un bracket parpadea el otro
vim.opt.errorbells = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.scrolloff = 8 -- cuando haces scroll deja 8 lineas de margen
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitright = true
-- vim.opt.list = true
-- vim.opt.listchars = { tab = ">·", trail = "·", extends = "~" }
-- vim.opt.listchars = { tab = ">~", trail = "·", space = "·", extends = "~" }
-- vim.opt.listchars = { tab = ">~", trail = "·", eol = "↲", space = "·", extends = "~" } --ejemplos

vim.opt.shortmess:append("c") -- para que no aparezcan mensajes de mas cuando este en completion

-- vim.cmd([[set iskeyword+=-]]) -- que words como hola-mundo vim las considere 1 sola para borrar por ej

local M = { proseMode = false }
function M.toggleProse()
	M.proseMode = not M.proseMode
	if M.proseMode then
		vim.opt.wrap = true
		vim.opt.linebreak = true
		vim.opt.columns = 80
		vim.opt.list = true
		vim.opt.listchars = { tab = ">~", trail = "·", eol = "↲", space = "·", extends = "#" } --ejemplos
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
