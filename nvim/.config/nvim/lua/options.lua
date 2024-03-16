vim.opt.laststatus = 2
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.wrap = false
vim.opt.errorbells = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", extends = "…" }
-- vim.opt.listchars = { space = "·", tab = "→ ", trail = "·", eol = "↲", extends = "…" }
vim.opt.iskeyword:append("-")
vim.opt.cursorline = true

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local M = { proseMode = false }
function M.toggleProse()
	M.proseMode = not M.proseMode
	if M.proseMode then
		vim.opt.wrap = true
		vim.opt.linebreak = true
		vim.opt.columns = 80
		vim.opt.list = true
		vim.opt.listchars = { tab = "→ ", trail = "·", eol = "↲", extends = "…" }
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
