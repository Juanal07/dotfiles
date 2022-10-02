local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-config.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- Investigar
  -- https://github.com/glepnir/dashboard-nvim
  -- Plug 'glepnir/lspsaga.nvim'
  --  preservim/vim-pencil para escribir prosa
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  -- Git
  use("TimUntersberger/neogit")
  use("sindrets/diffview.nvim")
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  -- Utils
  use("gpanders/editorconfig.nvim")
  --[[ Copilot uses a lot of ram ]]
  --[[ use("github/copilot.vim") ]]
  use({
    "ur4ltz/surround.nvim",
    config = function()
      require("surround").setup({ mappings_style = "surround" })
    end,
  })
  use("windwp/nvim-ts-autotag")
  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("folke/which-key.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope-media-files.nvim")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use("p00f/nvim-ts-rainbow")
  use("TovarishFin/vim-solidity")
  -- GUI
  use("gruvbox-community/gruvbox")
  use("fgheng/winbar.nvim")
  use("SmiteshP/nvim-navic")
  use("hoob3rt/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("ryanoasis/vim-devicons")
  use("onsails/lspkind-nvim")
  use("norcalli/nvim-colorizer.lua")
  use("RRethy/vim-illuminate")
  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
