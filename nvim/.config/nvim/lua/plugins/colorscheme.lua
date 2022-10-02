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

--[[ Remove CursorLine background color, only yellow number ]]
vim.cmd("hi CursorLineNr guibg=none")
vim.cmd("hi Keyword cterm=italic gui=italic")

--[[ vim-illuminate ]]
vim.cmd("hi def IlluminatedWordText guibg=#3c3836")
vim.cmd("hi def IlluminatedWordRead guibg=#3c3836")
vim.cmd("hi def IlluminatedWordWrite guibg=#3c3836")

--[[ Transparency ]]
--[[ vim.cmd("hi Normal guibg=NONE ctermbg=NONE")  ]]
