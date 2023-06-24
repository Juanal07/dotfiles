local function lsp_client_names()
  local client_names = {}
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    table.insert(client_names, client.name)
  end
  return table.concat(client_names, ",")
end

require("lualine").setup({
  options = {
    theme = "gruvbox",
  },
  sections = {
    -- lualine_a = { "mode" },
    lualine_b = {
      {
        "branch",
        fmt = function(str)
          if vim.api.nvim_strwidth(str) > 30 then
            return ("%s…"):format(str:sub(1, 29))
          end
          return str
        end,
      },
      "diff",
      "diagnostics",
    },
    lualine_c = { { "filename" }, { "lsp_progress" }, { lsp_client_names } },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    -- lualine_y = { "progress" },
    -- lualine_z = { "location" },
  },
})
