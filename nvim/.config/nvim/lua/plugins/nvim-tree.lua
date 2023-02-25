require("nvim-tree").setup({
    view = {
        width = {},
        hide_root_folder = true,
        mappings = {
            list = {
                { key = { "l", "<CR>" }, action = "edit" },
                { key = "h",             action = "close_node" },
                { key = "v",             action = "vsplit" },
                { key = "y",             action = "copy" },
                { key = "d",             action = "cut" },
                { key = "D",             action = "remove" },
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

-- Open nvim-tree on startup
local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
