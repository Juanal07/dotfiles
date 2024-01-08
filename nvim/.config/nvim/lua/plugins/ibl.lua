-- local highlight = {
-- 	"GruvboxRed",
-- 	"GruvboxYellow",
-- 	"GruvboxBlue",
-- 	"GruvboxOrange",
-- 	"GruvboxGreen",
-- 	"GruvboxPurple",
-- 	"GruvboxAqua",
-- 	"CursorColumn",
-- 	"Whitespace",
-- }
-- vim.g.rainbow_delimiters = { highlight = highlight }
-- require("ibl").setup({ scope = { highlight = highlight } })
-- local hooks = require("ibl.hooks")
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
-- 	vim.api.nvim_set_hl(0, "GruvboxRed", { fg = "#FB4934", underline = false }) -- Add underline = false to each line
-- 	vim.api.nvim_set_hl(0, "GruvboxYellow", { fg = "#FABD2F", underline = false })
-- 	vim.api.nvim_set_hl(0, "GruvboxBlue", { fg = "#83A598", underline = false })
-- 	vim.api.nvim_set_hl(0, "GruvboxOrange", { fg = "#D65D0E", underline = false })
-- 	vim.api.nvim_set_hl(0, "GruvboxGreen", { fg = "#B8BB26", underline = false })
-- 	vim.api.nvim_set_hl(0, "GruvboxPurple", { fg = "#D3869B", underline = false })
-- 	vim.api.nvim_set_hl(0, "GruvboxAqua", { fg = "#8EC07C", underline = false })
-- end)
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

vim.api.nvim_set_hl(0, "CurrentScope", { fg = "#a89984" })
require("ibl").setup({ scope = { highlight = "CurrentScope" } })
