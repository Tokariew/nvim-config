vim.pack.add({ "https://github.com/echasnovski/mini.pairs" })

require("mini.pairs").setup({
  markdown = true,
  skip_ts = { "string" },
})
