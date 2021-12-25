local colorscheme = "gruvbox"
-- TODO: how to set this in lua?
-- " set background=dark
-- " let g:gruvbox_italic=1
vim.g.background = "medium"
vim.g.gruvbox_italic = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
