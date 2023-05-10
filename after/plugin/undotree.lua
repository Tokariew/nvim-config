local undotree = require('undotree')
undotree.setup({
  window = {
    winblend = 0,
  },
})
vim.keymap.set("n", "<F6>", require('undotree').toggle, { noremap = true, silent = true })
