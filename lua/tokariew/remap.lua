vim.keymap.set("n", "<leader>q", ":wq<CR>")
vim.keymap.set("n", "<leader>Q", ":qa<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "\\\\", ":let@/=''<CR>", { silent = true })
for _, keymap in pairs({
    'zo',
    'zO',
    'zc',
    'zC',
    'za',
    'zA',
    'zv',
    'zx',
    'zX',
    'zm',
    'zr',
}) do
    vim.api.nvim_set_keymap('n', keymap, keymap .. '<CMD>IndentBlanklineRefresh<CR>', {
        noremap = true,
        silent = true
    })
end
