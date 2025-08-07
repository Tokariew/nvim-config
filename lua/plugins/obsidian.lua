return {
  "shastenm76/obsidian.nvim",
  version = "*",
  cmd = { "Obsidian" }, -- Load plugin when :Obsidian is called.
  ft = { "markdown" },  -- Lazy-load for Markdown files.
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    dir = "~/Documents/vimwiki/",           -- Vault directory.
    templates = {
      folder = "~/Documents/vimwiki/Atlas", -- Templates folder
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    ui = {
      enable = false
    },
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      }
    }
  },
}
