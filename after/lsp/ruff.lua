return {
  init_options = {
    settings = {
      configuration = vim.fn.expand("~/.config/ruff/ruff.toml"),
      organizeImports = true,
      showSyntaxErrors = true,
      lint = { enable = true },
    },
  },
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
}
