vim.pack.add({ "https://github.com/mfussenegger/nvim-dap-python" })

require("dap-python").setup(
  vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter"
)
