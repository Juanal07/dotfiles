local colorscheme = "gruvbox"
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = true,
  invert_intend_guides = false,
  inverse = true,
  contrast = "", -- can be "hard", "soft" or empty string (medium)
  palette_overrides = {},
  overrides = {
    SignColumn = { bg = "NONE" },
    CursorLineNr = { bg = "NONE" },
    GruvboxRedSign = { bg = "NONE" },
    GruvboxGreenSign = { bg = "NONE" },
    GruvboxYellowSign = { bg = "NONE" },
    GruvboxBlueSign = { bg = "NONE" },
    GruvboxAquaSign = { bg = "NONE" },
  },
  dim_inactive = false,
  transparent_mode = false,
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Vim-Illuminate
vim.cmd("hi def IlluminatedWordText guibg=#3c3836")
vim.cmd("hi def IlluminatedWordRead guibg=#3c3836")
vim.cmd("hi def IlluminatedWordWrite guibg=#3c3836")
