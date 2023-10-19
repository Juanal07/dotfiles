local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"xabikos/vscode-javascript",
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		build = "yarn install --frozen-lockfile && yarn compile",
	},
	-- GUI
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	"folke/tokyonight.nvim",
	"Mofiqul/vscode.nvim",
	"kyazdani42/nvim-tree.lua",
	"hoob3rt/lualine.nvim",
	"arkav/lualine-lsp-progress",
	"nvim-tree/nvim-web-devicons",
	"onsails/lspkind-nvim",
	"brenoprata10/nvim-highlight-colors",
	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",
	{
		"NeogitOrg/neogit",
		config = true,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			{
				"elgiano/nvim-treesitter-angular",
				branch = "topic/jsx-fix",
			},
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				-- ensure_installed = "all",
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
				},
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				-- sync_install = false,
				auto_install = true,
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},
	"RRethy/vim-illuminate",
	"kylechui/nvim-surround",
	"windwp/nvim-autopairs",
	"HiPhish/rainbow-delimiters.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	"nvim-telescope/telescope-media-files.nvim",
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- "github/copilot.vim",
	-- "gpanders/editorconfig.nvim",
})
