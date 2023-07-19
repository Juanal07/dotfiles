-- Auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

-- Autocommand that update packer plugins whenever you save packer-config.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-config.lua source <afile> | PackerSync
  augroup end
]])

local packer = require("packer")

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")
	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("xabikos/vscode-javascript")
	use({ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" })
	use("github/copilot.vim")
	-- Colorscheme
	use("ellisonleao/gruvbox.nvim")
	-- GUI
	use("kyazdani42/nvim-tree.lua")
	use("hoob3rt/lualine.nvim")
	use("arkav/lualine-lsp-progress")
	use("nvim-tree/nvim-web-devicons")
	use("onsails/lspkind-nvim")
	use("brenoprata10/nvim-highlight-colors")
	use("RRethy/vim-illuminate")
	-- Git
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")
	use("NeogitOrg/neogit")
	-- Utils
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })
	use("kylechui/nvim-surround")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("HiPhish/rainbow-delimiters.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim")
	use("folke/which-key.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-media-files.nvim")
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		after = "nvim-web-devicons",
		config = function()
			require("barbecue").setup()
		end,
	})
	-- use("gpanders/editorconfig.nvim")
	-- use({
	--   "iamcco/markdown-preview.nvim",
	--   run = function()
	--     vim.fn["mkdp#util#install"]()
	--   end,
	-- })

	-- Auto install packer if not installed
	if ensure_packer() then
		require("packer").sync()
	end
end)
