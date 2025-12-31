vim.lsp.config("ruff", {
  init_options = {
    configuration = "~/.config/ruff/ruff.toml",
    settings = {
      organizeimports = true,
      showsyntaxerrors = true,
      lint = { enable = true },
    },
  },
})
