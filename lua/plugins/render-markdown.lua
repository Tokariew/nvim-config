vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

require("render-markdown").setup({
  completion = {
    blink = {
      enabled = true,
    },
  },
  file_types = { "markdown", "vimwiki" },
})
