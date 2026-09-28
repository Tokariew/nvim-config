return {
  init_options = {
    settings = {
      configuration = vim.fs.joinpath(
        vim.fn.stdpath("config"),
        "utils",
        "ruff.toml"
      ),
      organizeImports = true,
      showSyntaxErrors = true,
      lint = { enable = true },
    },
  },
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
}
