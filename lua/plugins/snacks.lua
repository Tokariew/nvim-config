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

return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
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
    },
  },
}
