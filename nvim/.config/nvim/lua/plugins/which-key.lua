local wk = require("which-key")
wk.setup({
	win = {
		border = "border",
	},
})
wk.add({
	{ "<leader>f", group = "Telescope", icon = "🔭" },
	{ "<leader>m", group = "Neotest", icon = "🧪" },
	{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
	{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
})
