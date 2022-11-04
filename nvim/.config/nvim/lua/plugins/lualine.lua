require("lualine").setup({
	options = {
		theme = "gruvbox",
	},
	sections = {
		-- lualine_a = { "mode" },
		-- lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } }, -- Display path from the root of the project instead of only filename
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		-- lualine_y = { "progress" },
		-- lualine_z = { "location" },
	},
})
