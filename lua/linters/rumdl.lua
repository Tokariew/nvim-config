return {
  filetypes = { "markdown" },
  config = {
    -- rumdl 0.2.73 emits JSON diagnostics on stdout, not stderr.
    stream = "stdout",
    args = {
      "check",
      "--config",
      "MD013.line-length = 80",
      "--stdin-filename",
      function()
        local name = vim.api.nvim_buf_get_name(0)
        return name ~= "" and name or "stdin.md"
      end,
      "--output-format",
      "json",
      "-",
    },
  },
}
