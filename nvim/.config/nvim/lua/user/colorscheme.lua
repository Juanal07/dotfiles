-- local colorscheme = "vscode"
-- vim.g.vscode_style = "dark"
-- vim.g.vscode_italic_comment = 1

-- local colorscheme = "darkplus"
local colorscheme = "gruvbox"
-- vim.g.background = "medium"
-- vim.g.gruvbox_italic = 1

-- local colorscheme = "dracula"
-- local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
