return {
  {
    "dhruvasagar/vim-table-mode",
  },
  {
    "jbyuki/venn.nvim",
    keys = {
      { "f", ":VBox<cr>", mode = "v", desc = "Make a box" },
      { "<leader>v", ":lua Toggle_venn()<cr>", desc = "Toggle Venn drawing" },
    },
    config = function()
      function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd([[setlocal ve=all]])
          -- draw a line on HJKL keystokes
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "J",
            "<C-v>j:VBox<CR>",
            { noremap = true }
          )
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "K",
            "<C-v>k:VBox<CR>",
            { noremap = true }
          )
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "L",
            "<C-v>l:VBox<CR>",
            { noremap = true }
          )
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "H",
            "<C-v>h:VBox<CR>",
            { noremap = true }
          )
        -- draw a box by pressing "f" with visual selection
        else
          vim.cmd([[setlocal ve=]])
          vim.api.nvim_buf_del_keymap(0, "n", "J")
          vim.api.nvim_buf_del_keymap(0, "n", "K")
          vim.api.nvim_buf_del_keymap(0, "n", "L")
          vim.api.nvim_buf_del_keymap(0, "n", "H")
          vim.b.venn_enabled = nil
        end
      end
    end,
  },
}
