vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Enable servers named by your after/lsp/*.lua files.
local files =
  vim.fn.glob(vim.fn.stdpath("config") .. "/after/lsp/*.lua", false, true)

local servers = vim.tbl_map(function(path)
  return vim.fn.fnamemodify(path, ":t:r")
end, files)

vim.lsp.enable(servers)
