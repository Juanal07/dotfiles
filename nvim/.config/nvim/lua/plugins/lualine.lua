local function lsp_client_names()
	local client_icons = {
		-- ["tsserver"] = "",
		-- ["angularls"] = "",
		-- ["lua_ls"] = "",
		-- ["copilot"] = "",
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
			{ "filename" },
			"diff",
			"diagnostics",
		},
		lualine_c = {
			"branch",
			-- fmt = function(str)
			-- 	if vim.api.nvim_strwidth(str) > 30 then
			-- 		return ("%s…"):format(str:sub(1, 29))
			-- 	end
			-- 	return str
			-- end,
		},
		-- lualine_c = { "filename" },
		lualine_x = {
			{ "lsp_progress" },
			{ lsp_client_names },
			{
				"copilot",
				-- Default values
				symbols = {
					status = {
						icons = {
							enabled = " ",
							disabled = " ",
							warning = " ",
							unknown = " ",
						},
						hl = {
							enabled = "#50FA7B",
							disabled = "#6272A4",
							warning = "#FFB86C",
							unknown = "#FF5555",
						},
					},
					spinners = require("copilot-lualine.spinners").dots,
					spinner_color = "#6272A4",
				},
				show_colors = false,
				show_loading = true,
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		-- lualine_y = { "progress" },
		-- lualine_z = { "location" },
	},
})
