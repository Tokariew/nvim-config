vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  {
    src = "https://github.com/olimorris/codecompanion.nvim",
    version = vim.version.range("^19"),
  },
})

require("codecompanion").setup({
  interactions = {
    chat = {
      adapter = "opencode",
    },
  },
})

vim.keymap.set(
  { "n", "x" },
  "<leader>ac",
  "<cmd>CodeCompanionChat Toggle<cr>",
  { desc = "AI: toggle chat" }
)
vim.keymap.set(
  { "n", "x" },
  "<leader>aa",
  "<cmd>CodeCompanionActions<cr>",
  { desc = "AI: actions" }
)
vim.keymap.set(
  "x",
  "<leader>as",
  "<cmd>CodeCompanionChat Add<cr>",
  { desc = "AI: add selection to chat" }
)
vim.keymap.set(
  "n",
  "<leader>ar",
  "<cmd>CodeCompanion Retry<cr>",
  { desc = "AI: retry" }
)
vim.keymap.set(
  "n",
  "<leader>ad",
  "<cmd>CodeCompanion ToggleDiff<cr>",
  { desc = "AI: toggle diff" }
)
vim.keymap.set(
  "x",
  "<leader>ae",
  "<cmd>CodeCompanionChat Edit<cr>",
  { desc = "AI: edit selection" }
)
vim.keymap.set(
  "x",
  "<leader>af",
  "<cmd>CodeCompanionChat Refactor<cr>",
  { desc = "AI: refactor" }
)
vim.keymap.set(
  "x",
  "<leader>ax",
  "<cmd>CodeCompanionChat Explain<cr>",
  { desc = "AI: explain selection" }
)
