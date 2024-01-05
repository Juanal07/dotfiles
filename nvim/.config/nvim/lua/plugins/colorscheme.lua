local colorscheme = "gruvbox"
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
	},
})
vim.cmd("colorscheme " .. colorscheme)
vim.cmd("highlight FoldColumn guibg='none' guifg='none'")
vim.opt.pumblend = 5
vim.opt.winblend = 5

-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "CmpNormal", { bg = "none" })
-- vim.cmd([[
--   set completeopt=menuone,noinsert,noselect
--   highlight CmpBorder guifg=#2d2e43 guibg=NONE
--   highlight CmpPmenu guifg=#fefefe guibg=NONE
--   highlight CmpDocBorder guifg=#2d2e43 guibg=NONE
--   highlight CmpDocPmenu guifg=#fefefe guibg=NONE
--   highlight CmpItemMenuDefault guifg=#fefefe guibg=NONE
--   highlight CmpItemKind guifg=#fefefe guibg=NONE
-- ]])
-- vim.cmd("highlight Pmenu guibg='none' guifg='none'")
-- vim.cmd("highlight PmenuSel guibg='none' guifg='none'")
-- vim.cmd("highlight PmenuSbar guibg='none' guifg='none'")

require("cmp").setup({
	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
		},
		documentation = {
			border = "rounded",
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
		},
	},
})

-- Transparency background, needs terminal with transparency enabled
-- vim.cmd("highlight Normal ctermbg='none' guibg='none'")
