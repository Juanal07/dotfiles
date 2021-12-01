--WHICH-KEY
require("which-key").setup({})
local wk = require("which-key")
wk.register({
	["<leader>"] = {
		w = { "<cmd>:w<cr>", "Save" },
		q = { "<cmd>:q<cr>", "Quit" },
	},
})
