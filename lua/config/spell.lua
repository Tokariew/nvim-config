require("nvim.spellfile").config({
  confirm = false,
  timeout_ms = 15000,
})

vim.opt.spelllang = { "en_gb", "pl" }
vim.opt.spell = true
vim.opt.spellsuggest = "best,20"
vim.opt.spelloptions = "camel"
