local colorscheme = "gruvbox"
-- vim.opt.bg = "light"
-- vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_dark = "medium"
-- vim.g.gruvbox_contrast_dark = "soft"
vim.g.gruvbox_italic = 1
vim.g.gruvbox_italicize_strings = 1
vim.g.gruvbox_sign_column = "bg0"
-- vim.g.gruvbox_invert_indent_guides = 1
-- vim.g.gruvbox_invert_tabline = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd("highlight CursorLineNr guibg=none") -- Remove CursorLine background color, only yellow number
-- vim.cmd("highlight Normal guibg=NONE ctermbg=NONE") -- Transparency
