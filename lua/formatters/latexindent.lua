return {
  filetypes = { "tex", "plaintex" },
  timeout_ms = 5000,
  config = {
    prepend_args = {
      "-rv",
      "-m",
      "-l",
      vim.fs.joinpath(vim.fn.stdpath("config"), "utils", "latexindent.yaml"),
    },
  },
}
