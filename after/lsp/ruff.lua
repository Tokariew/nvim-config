vim.lsp.config("ruff", {
  init_options = {
    configuration = "~/.config/ruff/ruff.toml",
    settings = {
      organizeImports = true,
      showSyntaxErrors = true,
      lint = { enable = true },
    },
  },
})
