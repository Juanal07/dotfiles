local colorscheme = "gruvbox"
-- vim.opt.bg = "light"
-- vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_dark = "medium"
-- vim.g.gruvbox_contrast_dark = "soft"
vim.g.gruvbox_italicize_strings = 1
vim.g.gruvbox_italic = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE") -- Transparency
