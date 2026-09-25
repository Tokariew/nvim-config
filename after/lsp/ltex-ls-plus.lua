return {
  cmd = { "ltex-ls-plus" },
  filetypes = { "markdown", "tex", "plaintex", "mail" },
  root_markers = { ".git" },

  get_language_id = function(_, filetype)
    if filetype == "tex" or filetype == "plaintex" then
      return "latex"
    elseif filetype == "mail" then
      return "markdown"
    end
    return filetype
  end,

  handlers = {
    ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      if result and result.uri then
        local bufnr = vim.uri_to_bufnr(result.uri)

        if vim.bo[bufnr].filetype == "mail" then
          result.diagnostics = vim.tbl_filter(function(diagnostic)
            local line = vim.api.nvim_buf_get_lines(
              bufnr,
              diagnostic.range.start.line,
              diagnostic.range.start.line + 1,
              false
            )[1] or ""

            return not line:match("^%s*>+")
          end, result.diagnostics)
        end
      end

      vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
    end,
  },

  settings = {
    ltex = {
      enabled = { "markdown", "latex" },
      language = "auto",

      dictionary = {
        ["en-GB"] = { "Neovim", "Lua" },
        ["pl-PL"] = { "Neovim", "Lua" },
      },
    },
  },
}
