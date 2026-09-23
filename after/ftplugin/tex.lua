vim.keymap.set(
  "n",
  "<leader>tb",
  ":LspTexlabBuild<CR>",
  { buffer = true, desc = "[T]exlab [b]uild" }
)
vim.keymap.set(
  "n",
  "<leader>tf",
  ":LspTexlabForward<CR>",
  { buffer = true, desc = "[T]exlab [f]orward search" }
)
vim.opt_local.tw = 80
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 4
