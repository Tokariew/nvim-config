return {
  filetypes = { "markdown" },
  config = {
    args = {
      "fmt",
      "--config",
      "MD013.line-length = 80",
      "--config",
      "MD013.reflow = true",
      "--stdin-filename",
      "$FILENAME",
      "-",
    },
  },
}
