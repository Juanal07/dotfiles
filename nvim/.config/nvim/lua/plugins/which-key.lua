require("which-key").setup({
	window = {
		border = "rounded",
		winblend = 10,
	},
})
require("which-key").register({
	["<leader>"] = {
		f = { name = "Telescope" },
		m = { name = "Neotest" },
	},
})
