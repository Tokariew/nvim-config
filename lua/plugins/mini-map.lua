vim.pack.add({ "https://github.com/nvim-mini/mini.map" })

local map = require("mini.map")
map.setup({
  integrations = {
    map.gen_integration.diff(),
    map.gen_integration.diagnostic({
      error = "DiagnosticFloatingError",
      warn = "DiagnosticFloatingWarn",
      info = "DiagnosticFloatingInfo",
      hint = "DiagnosticFloatingHint",
    }),
  },
  symbols = {
    encode = map.gen_encode_symbols.dot("4x2"),
    scroll_line = "▶",
    scroll_view = "│",
  },
  window = {
    side = "right",
    width = 12,
    winblend = 25,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("mini-map-open", { clear = true }),
  once = true,
  callback = map.open,
})

vim.keymap.set("n", "<leader>ti", map.toggle, {
  desc = "[T]oggle m[i]nimap",
})
vim.keymap.set("n", "<leader>mf", map.toggle_focus, {
  desc = "[M]inimap [f]ocus",
})
