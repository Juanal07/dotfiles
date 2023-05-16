local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params({}),
    function(err, res, ctx)
      if err then
        local err_msg = type(err) == "string" and err or err.message
        -- you can modify the log message / level (or ignore it completely)
        vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
        return
      end

      -- don't apply results if buffer is unloaded or has been modified
      if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
        return
      end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd("silent noautocmd update")
        end)
      end
    end
  )
end

null_ls.setup({
  debug = false,
  sources = {
    -- Editorconfig
    -- diagnostics.editorconfig_checker,

    -- JS/TS
    formatting.prettier,
    -- diagnostics.eslint_d,

    -- Lua
    formatting.stylua,

    -- Python
    formatting.black,
    -- diagnostics.flake8,

    -- Rust
    formatting.rustfmt,

    -- Bash
    formatting.beautysh,
    -- formatting.shfmt,

    -- C, C++
    -- formatting.clang_format,
  },
  -- Format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- async_formatting(bufnr)
          vim.lsp.buf.format({ bufnr = bufnr })
          -- local current_formatter = nil
          -- for _, source in ipairs(null_ls.builtins.formatting) do
          -- 	if source.name == "prettier" then
          -- 		if vim.tbl_contains(source.filetypes, vim.api.nvim_buf_get_option(bufnr, "filetype")) then
          -- 			current_formatter = source
          -- 			break
          -- 		end
          -- 	end
          -- end
          -- if current_formatter then
          -- 	async_formatting(bufnr)
          -- else
          -- 	vim.lsp.buf.format({ bufnr = bufnr })
          -- end
        end,
      })
    end
  end,
})
