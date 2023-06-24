local colorscheme = "gruvbox"
require("gruvbox").setup({
	invert_tabline = false,
	invert_intend_guides = false,
	overrides = {
		-- Keyword = { fg = "#fb4934", italic = true },
		SignColumn = { bg = "NONE" },
		CursorLineNr = { bg = "NONE" },
		GruvboxRedSign = { bg = "NONE" },
		GruvboxGreenSign = { bg = "NONE" },
		GruvboxYellowSign = { bg = "NONE" },
		GruvboxBlueSign = { bg = "NONE" },
		GruvboxAquaSign = { bg = "NONE" },
		-- html tags different from jsx tags
		-- Tag = { fg = "#ebdbb2" },
	},
})

vim.cmd("colorscheme " .. colorscheme)

-- Vim-Illuminate
vim.cmd("hi def IlluminatedWordText guibg=#3c3836")
vim.cmd("hi def IlluminatedWordRead guibg=#3c3836")
vim.cmd("hi def IlluminatedWordWrite guibg=#3c3836")

-- Transparency background
vim.cmd("hi Normal ctermbg=none guibg=none")

-- TODO: Transparency Telescope not working
vim.cmd("hi def TelescopeTitle ctermbg=none guibg=none")
vim.cmd("hi def TelescopeNormal ctermbg=none guibg=none")
vim.cmd("hi def TelescopeBorder ctermbg=none guibg=none")
vim.cmd("hi def TelescopePromptNormal ctermbg=none guibg=none")
vim.cmd("hi def TelescopePromptBorder ctermbg=none guibg=none")
vim.cmd("hi def TelescopePreviewNormal ctermbg=none guibg=none")
vim.cmd("hi def TelescopePreviewBorder ctermbg=none guibg=none")
vim.cmd("hi def TelescopeResultsNormal ctermbg=none guibg=none")
vim.cmd("hi def TelescopeResultsBorder ctermbg=none guibg=none")
