vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local hl_list = {}
for i, color in pairs({
  "#662121",
  "#767621",
  "#216631",
  "#325a5e",
  "#324b7b",
  "#562155",
}) do
  local name = "Wrum" .. i
  vim.api.nvim_set_hl(0, name, { fg = color })
  table.insert(hl_list, name)
end

require("snacks").setup({
  animate = {
    fps = 240,
  },
  scope = {
    enabled = true,
  },
  image = {
    enabled = true,
  },
  indent = {
    enabled = true,
    indent = {
      char = "┊",
      hl = hl_list,
    },
    scope = {
      enabled = true,
      underline = true,
      char = "┊",
    },
  },
  scroll = {
    enabled = true,
  },
  statuscolumn = {
    enabled = true,
    git = {
      patterns = { "MiniDiffSign" },
    },
  },
  notifier = {
    enabled = true,
  },
  words = {
    enabled = true,
  },
})

vim.api.nvim_create_autocmd("LspProgress", {
  callback = function()
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
    })
  end,
})
