return {
  {
    "f3fora/nvim-texlabconfig",
    config = function()
      require("texlabconfig").setup(config)
    end,
    ft = { "tex", "bib" }, -- Lazy-load on filetype
    build = "go build",
  },
}
