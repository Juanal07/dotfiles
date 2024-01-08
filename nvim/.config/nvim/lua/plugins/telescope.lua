local telescope = require("telescope")
telescope.load_extension("media_files")
telescope.setup({
	shorten_path = true,
	defaults = {
		layout_config = { prompt_position = "top" },
		sorting_strategy = "ascending",
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { "node_modules", ".next", "dist" },
		winblend = 10,
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
		},
	},
	extensions = {
		media_files = {
			filetypes = { "jpeg", "ico", "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
			find_cmd = "fd",
		},
	},
})
