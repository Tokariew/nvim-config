return {
  filetypes = { "sh" },
  config = {
    prepend_args = {
      "--simplify",
      "--binary-next-line",
      "--case-indent",
      "--space-redirects",
      "--keep-padding",
      "--indent",
      "4",
    },
  },
}
