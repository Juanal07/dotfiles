require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    -- additional_vim_regex_highlighting = true,
  },
  indent = {
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
