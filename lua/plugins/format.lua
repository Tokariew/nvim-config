return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
    formatters = {
      stylua = {
        prepend_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
          "--column-width",
          "80",
        },
      },
    },
  },
  keys = {
    {
      "<leader>fc",
      function()
        require("conform").format()
      end,
      desc = "[F]ormat with [c]onform",
      mode = { "n", "v" },
    },
  },
}
