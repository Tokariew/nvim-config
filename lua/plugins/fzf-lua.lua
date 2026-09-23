vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({})

vim.keymap.set(
  "n",
  "<leader>gr",
  "<cmd>FzfLua lsp_references<cr>",
  { desc = "[G]oto [R]eferences" }
)
vim.keymap.set(
  "n",
  "<leader>ds",
  "<cmd>FzfLua lsp_document_symbols<cr>",
  { desc = "[D]ocument [S]ymbols" }
)
vim.keymap.set(
  "n",
  "<leader>ws",
  "<cmd>FzfLua lsp_workspace_symbols<cr>",
  { desc = "[W]orkspace [S]ymbols" }
)
vim.keymap.set(
  "n",
  "<leader><space>",
  "<cmd>FzfLua buffers<cr>",
  { desc = "Find existing buffers" }
)
vim.keymap.set(
  "n",
  "<leader>?",
  "<cmd>FzfLua oldfiles<cr>",
  { desc = "[?] Find recently opened files" }
)
vim.keymap.set(
  "n",
  "<leader>sd",
  "<cmd>FzfLua diagnostics_workspace<cr>",
  { desc = "[S]earch [d]iagnostics" }
)
vim.keymap.set(
  "n",
  "<leader>sf",
  "<cmd>FzfLua files<cr>",
  { desc = "[S]earch [f]iles" }
)
vim.keymap.set(
  "n",
  "<leader>sh",
  "<cmd>FzfLua helptags<cr>",
  { desc = "[S]earch [h]elp" }
)
vim.keymap.set(
  "n",
  "<leader>sg",
  "<cmd>FzfLua live_grep_native<cr>",
  { desc = "[S]earch by [G]rep" }
)
vim.keymap.set(
  "n",
  "<leader>sw",
  "<cmd>FzfLua grep_cWORD<cr>",
  { desc = "[S]earch current [W]ord" }
)
vim.keymap.set(
  "n",
  "<leader>se",
  "<cmd>FzfLua grep_project<cr>",
  { desc = "[S]earch by fuzzy gr[e]p" }
)
vim.keymap.set("n", "<leader>/", function()
  require("fzf-lua").blines({ previewer = false })
end, { desc = "[/] Fuzzily search in buffer" })
