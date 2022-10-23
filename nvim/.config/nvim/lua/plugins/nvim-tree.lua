require("nvim-tree").setup({
  open_on_setup = true,
  view = {
    hide_root_folder = true,
    mappings = {
      list = {
        { key = { "l", "<CR>" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "y", action = "copy" },
        { key = "d", action = "cut" },
        { key = "D", action = "remove" },
      },
    },
  },
  renderer = {
    icons = {
      git_placement = "after",
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
