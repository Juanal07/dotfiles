local function lsp_client_names()
	local client_icons = {
		-- ["tsserver"] = "",
		-- ["copilot"] = "",
		-- ["lua_ls"] = "",
	}

	local active_clients = vim.lsp.get_active_clients()
	local client_names = {}

	for _, client in ipairs(active_clients) do
		local icon = client_icons[client.name]
		if icon then
			table.insert(client_names, icon)
		else
			table.insert(client_names, "[" .. client.name .. "]")
		end
	end

	return table.concat(client_names, "  ")
end

require("lualine").setup({
	options = {
		theme = "gruvbox",
		-- theme = "tokyonight",
		-- theme = "vscode",
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
		-- lualine_c = { "filename" },
		lualine_x = { { "lsp_progress" }, { lsp_client_names }, "encoding", "fileformat", "filetype" },
		-- lualine_y = { "progress" },
		-- lualine_z = { "location" },
	},
})
