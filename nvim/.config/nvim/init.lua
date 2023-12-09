require("options")
require("keymaps")
require("lazy-config")

require("plugins.lsp")
require("plugins.null-ls")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.ufo")

require("nvim-surround").setup()
require("nvim-autopairs").setup()
require("nvim-web-devicons").setup()
require("nvim-highlight-colors").setup({ enable_tailwind = true })
-- require("Comment").setup()
-- require("ts_context_commentstring").setup({
-- 	enable_autocmd = false,
-- })
-- vim.g.skip_ts_context_commentstring_module = true

local highlight = {
	"GruvboxRed",
	"GruvboxYellow",
	"GruvboxBlue",
	"GruvboxOrange",
	"GruvboxGreen",
	"GruvboxPurple",
	"GruvboxAqua",
	"CursorColumn",
	"Whitespace",
}
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "GruvboxRed", { fg = "#FB4934", underline = false }) -- Add underline = false to each line
	vim.api.nvim_set_hl(0, "GruvboxYellow", { fg = "#FABD2F", underline = false })
	vim.api.nvim_set_hl(0, "GruvboxBlue", { fg = "#83A598", underline = false })
	vim.api.nvim_set_hl(0, "GruvboxOrange", { fg = "#D65D0E", underline = false })
	vim.api.nvim_set_hl(0, "GruvboxGreen", { fg = "#B8BB26", underline = false })
	vim.api.nvim_set_hl(0, "GruvboxPurple", { fg = "#D3869B", underline = false })
	vim.api.nvim_set_hl(0, "GruvboxAqua", { fg = "#8EC07C", underline = false })
end)
vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({ scope = { highlight = highlight } })
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
