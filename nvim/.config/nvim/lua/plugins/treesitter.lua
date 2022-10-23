require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  -- Plugins
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
