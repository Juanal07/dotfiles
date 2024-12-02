require("gruvbox").setup({
	invert_tabline = false,
	invert_intend_guides = false,
	overrides = {
		SignColumn = { bg = "NONE" },
		CursorLineNr = { bg = "NONE" },
		GruvboxRedSign = { bg = "NONE" },
		GruvboxGreenSign = { bg = "NONE" },
		GruvboxYellowSign = { bg = "NONE" },
		GruvboxBlueSign = { bg = "NONE" },
		GruvboxAquaSign = { bg = "NONE" },
		-- TODO: replace string for gruvbox darkgrey variable
		IlluminatedWordText = { bg = "#3c3836", fg = "none" },
		IlluminatedWordRead = { bg = "#3c3836", fg = "none" },
		IlluminatedWordWrite = { bg = "#3c3836", fg = "none" },
	},
})
vim.cmd("colorscheme gruvbox")

-- vim.cmd("highlight Normal ctermbg='none' guibg='none'")
vim.cmd("highlight FoldColumn guibg='none'")
vim.cmd("highlight NormalFloat guibg='none'")
vim.cmd("highlight FloatBorder guibg='none'")

vim.opt.pumblend = 10
vim.opt.winblend = 10
