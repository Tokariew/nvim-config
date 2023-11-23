local hl_list = {}
for i, color in pairs({ '#662121', '#767621', '#216631', '#325a5e', '#324b7b', '#562155' }) do
  local name = 'IndentBlanklineIndent' .. i
  vim.api.nvim_set_hl(0, name, { fg = color })
  table.insert(hl_list, name);
end

require("ibl").setup {
  indent = { char = '┊', highlight = hl_list },
  scope = { enabled = true, show_start = true, show_end = true },
}
