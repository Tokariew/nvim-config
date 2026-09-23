vim.pack.add({ "https://github.com/jbyuki/venn.nvim" })

function _G.Toggle_venn()
  if vim.b.venn_enabled == nil then
    vim.b.venn_enabled = true
    vim.cmd([[setlocal ve=all]])
    for _, key in ipairs({ "J", "K", "L", "H" }) do
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        key,
        "<C-v>" .. key:lower() .. ":VBox<CR>",
        {
          noremap = true,
        }
      )
    end
  else
    vim.cmd([[setlocal ve=]])
    for _, key in ipairs({ "J", "K", "L", "H" }) do
      vim.api.nvim_buf_del_keymap(0, "n", key)
    end
    vim.b.venn_enabled = nil
  end
end

vim.keymap.set("v", "f", ":VBox<CR>", { desc = "Make a box" })
vim.keymap.set("n", "<leader>v", ":lua Toggle_venn()<CR>", {
  desc = "Toggle Venn drawing",
})
