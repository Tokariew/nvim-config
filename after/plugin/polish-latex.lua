local ts = vim.treesitter
local parsers = require('nvim-treesitter.parsers')

local function is_inside_verbatim(node, bufnr)
  while node do
    if node:type() == "verbatim_environment" then
      return true
    end
    node = node:parent()
  end
  return false
end

function PolishTypoFixTS()
  vim.cmd("write")
  local bufnr = vim.api.nvim_get_current_buf()
  local lang = parsers.get_buf_lang(bufnr)
  local parser = parsers.get_parser(bufnr, lang)
  local tree = parser:parse()[1]
  local root = tree:root()

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  for i, line in ipairs(lines) do
    local new_line = line
    local modified = false

    new_line = new_line:gsub("(%s)([aiouwz])(%s+)", function(space1, letter, space2)
      local row = i - 1
      local col = #space1 -- approximate column where the letter starts
      local node = root:descendant_for_range(row, col, row, col)

      if not is_inside_verbatim(node, bufnr) then
        modified = true
        return space1 .. letter .. "~"
      else
        return space1 .. letter .. space2
      end
    end)

    if modified then
      lines[i] = new_line
    end
  end

  for i = 1, #lines - 1 do
    local this_line = lines[i]
    local next_line = lines[i + 1]

    local _, _, before, letter = this_line:find("^(.-)%s([aiouwz1-9])%s*$")
    if before and next_line then
      local current_row = i - 1
      local next_row = i

      local current_node = root:descendant_for_range(current_row, #before, current_row, #this_line)
      local next_node = root:descendant_for_range(next_row, 0, next_row, #next_line)

      if not is_inside_verbatim(current_node, bufnr) and not is_inside_verbatim(next_node, bufnr) then
        lines[i] = before
        -- lines[i + 1] = letter .. "~" .. next_line
        local _, _, indent, rest = next_line:find("^(%s*)(.*)$")
        lines[i + 1] = indent .. letter .. "~" .. rest
      end
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end

vim.api.nvim_set_keymap('n', '<leader>tp', ':lua PolishTypoFixTS()<CR>', { noremap = true, silent = false })
