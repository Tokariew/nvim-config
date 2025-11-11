return {
  {
    "ibhagwan/fzf-lua",
    opts = {},
    keys = {
      {
        "<leader>gr",
        "<cmd>FzfLua lsp_references<cr>",
        desc = "[G]oto [R]eferences",
      },
      {
        "<leader>ds",
        "<cmd>FzfLua lsp_document_symbols<cr>",
        desc = "[D]ocument [S]ymbols",
      },
      {
        "<leader>ws",
        "<cmd>FzfLua lsp_workspace_symbols<cr>",
        desc = "[W]orkspace [S]ymbols",
      },
      {
        "<leader><space>",
        "<cmd>FzfLua buffers<cr>",
        desc = "Find existing buffers",
      },
      {
        "<leader>?",
        "<cmd>FzfLua oldfiles<cr>",
        desc = "[?] Find recently opened files",
      },
      {
        "<leader>sd",
        "<cmd>FzfLua diagnostics_workspace<cr>",
        desc = "[S]earch [d]iagnostics",
      },
      { "<leader>sf", "<cmd>FzfLua files<cr>", desc = "[S]earch [f]iles" },
      { "<leader>sh", "<cmd>FzfLua helptags<cr>", desc = "[S]earch [h]elp" },
      {
        "<leader>sg",
        "<cmd>FzfLua live_grep_native<cr>",
        desc = "[S]earch by [G]rep",
      },
      {
        "<leader>sw",
        "<cmd>FzfLua grep_cWORD<cr>",
        desc = "[S]earch current [W]ord",
      },
      {
        "<leader>se",
        "<cmd>FzfLua grep_project<cr>",
        desc = "[S]earch by fuzzy gr[e]p",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").blines({ previewer = false })
        end,
        desc = "[/] Fuzzily search in buffer",
      },
    },
  },
}
