-- local colorscheme = "darkplus"

-- local colorscheme = "vscode"
-- vim.g.vscode_style = "dark"
-- vim.g.vscode_italic_comment = 1

-- require("onedark").setup({
-- 	style = "darker",
-- })
-- require("onedark").load()

local colorscheme = "gruvbox"
vim.g.background = "medium"
vim.g.gruvbox_italic = 1

-- local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
