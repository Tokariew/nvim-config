vim.pack.add({ "https://github.com/jiaoshijie/undotree" })

require("undotree").setup({
  window = {
    winblend = 0,
  },
})

vim.keymap.set("n", "<F6>", function()
  require("undotree").toggle()
end, { desc = "Toggle Undotree" })
