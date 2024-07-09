require("neotest").setup({
	summary = {
		open = "botright vsplit | vertical resize 120",
	},
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
	},
})
