local colorscheme = "gruvbox"
require("gruvbox").setup({
  invert_tabline = false,
  invert_intend_guides = false,
  overrides = {
    -- Keyword = { fg = "#fb4934", italic = true },
    SignColumn = { bg = "NONE" },
    CursorLineNr = { bg = "NONE" },
    GruvboxRedSign = { bg = "NONE" },
    GruvboxGreenSign = { bg = "NONE" },
    GruvboxYellowSign = { bg = "NONE" },
    GruvboxBlueSign = { bg = "NONE" },
    GruvboxAquaSign = { bg = "NONE" },
    -- html tags different from jsx tags
    -- Tag = { fg = "#ebdbb2" },
  },
})

vim.cmd("colorscheme " .. colorscheme)

-- Vim-Illuminate
vim.cmd("hi def IlluminatedWordText guibg=#3c3836")
vim.cmd("hi def IlluminatedWordRead guibg=#3c3836")
vim.cmd("hi def IlluminatedWordWrite guibg=#3c3836")

-- Transparency background
vim.cmd("hi Normal ctermbg=none guibg=none")
