vim.pack.add({ "https://github.com/gaoDean/autolist.nvim" })

require("autolist").setup()

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("autolist-maps", { clear = true }),
  pattern = { "markdown", "text", "tex", "plaintex", "norg" },
  callback = function(args)
    vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>", { buffer = args.buf })
    vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>", {
      buffer = args.buf,
    })
    vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", {
      buffer = args.buf,
    })
    vim.keymap.set(
      "n",
      "o",
      "o<cmd>AutolistNewBullet<cr>",
      { buffer = args.buf }
    )
    vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>", {
      buffer = args.buf,
    })
    vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", {
      buffer = args.buf,
    })
    vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>", {
      buffer = args.buf,
    })

    -- cycle list types with dot-repeat
    vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, {
      expr = true,
      buffer = args.buf,
    })
    vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, {
      expr = true,
      buffer = args.buf,
    })

    -- functions to recalculate list on edit
    vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>", {
      buffer = args.buf,
    })
    vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>", {
      buffer = args.buf,
    })
    vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>", {
      buffer = args.buf,
    })
    vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>", {
      buffer = args.buf,
    })
  end,
})
