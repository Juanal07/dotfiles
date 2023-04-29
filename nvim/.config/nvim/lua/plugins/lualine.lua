require("lualine").setup({
	options = {
		theme = "gruvbox",
	},
	sections = {
		-- lualine_a = { "mode" },
		lualine_b = {
			{
				"branch",
				fmt = function(str)
					if vim.api.nvim_strwidth(str) > 30 then
						return ("%s…"):format(str:sub(1, 29))
					end
					return str
				end,
			},
			"diff",
			"diagnostics",
		},
		-- lualine_c = { { "filename", path = 1 } }, -- Display path from the root of the project instead of only filename
		-- lualine_c = { "filename" },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		-- lualine_y = { "progress" },
		-- lualine_z = { "location" },
	},
})
