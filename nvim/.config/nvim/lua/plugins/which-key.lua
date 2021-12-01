require("which-key").setup({})
local wk = require("which-key")
wk.register({
	["<leader>"] = {
		w = { "Save" },
		q = { "Quit" },
		r = { "Refresh nvim-tree" },
		n = { "Open nvim-tree" },
		["<space>"] = { "Go to last buffer" },
		["<cr>"] = { "Source init.vim" },
		f = {
			name = "Telescope",
		},
	},
})
