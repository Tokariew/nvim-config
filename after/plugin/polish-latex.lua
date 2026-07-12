local ts = vim.treesitter

local function is_inside_verbatim(node)
  while node do
    local t = node:type()

    if t == "verbatim_environment" or t:match("verbatim") then
      return true
    end

    node = node:parent()
  end

  return false
end

local function node_at(root, row, col)
  return root:descendant_for_range(row, col, row, col)
end

local function line_typo_fix(line, row, root)
  local out = {}
  local pos = 1
  local modified = false

  while true do
    local s, e, space1, letter, space2 = line:find("(%s)([aiouwz])(%s+)", pos)

    if not s then
      table.insert(out, line:sub(pos))
      break
    end

    table.insert(out, line:sub(pos, s - 1))

    -- Lua strings are byte-indexed, Treesitter columns are byte-indexed and 0-based.
    -- The letter starts after the captured leading whitespace.
    local letter_col = s - 1 + #space1
    local node = node_at(root, row, letter_col)

    if not is_inside_verbatim(node) then
      table.insert(out, space1 .. letter .. "~")
      modified = true
    else
      table.insert(out, space1 .. letter .. space2)
    end

    pos = e + 1
  end

  return table.concat(out), modified
end

function PolishTypoFixTS()
  vim.cmd("write")

  local bufnr = vim.api.nvim_get_current_buf()

  -- Let Neovim infer the parser language from the buffer filetype.
  -- For TeX files this should usually resolve to "latex".
  local parser, err = ts.get_parser(bufnr)

  if not parser then
    vim.notify(
      "PolishTypoFixTS: no Treesitter parser available: " .. tostring(err),
      vim.log.levels.ERROR
    )
    return
  end

  local trees = parser:parse()
  local tree = trees and trees[1]

  if not tree then
    vim.notify("PolishTypoFixTS: could not parse buffer", vim.log.levels.ERROR)
    return
  end

  local root = tree:root()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- Fix one-letter words inside one line: " i " -> " i~"
  for i, line in ipairs(lines) do
    local row = i - 1
    local new_line, modified = line_typo_fix(line, row, root)

    if modified then
      lines[i] = new_line
    end
  end

  -- Fix one-letter words at end of line:
  --
  --   coś i
  --   dalej
  --
  -- becomes:
  --
  --   coś
  --   i~dalej
  for i = 1, #lines - 1 do
    local this_line = lines[i]
    local next_line = lines[i + 1]

    local before, letter = this_line:match("^(.-)%s([aiouwz1-9])%s*$")

    if before and next_line then
      local current_row = i - 1
      local next_row = i

      local current_node =
        root:descendant_for_range(current_row, #before, current_row, #this_line)

      local next_node =
        root:descendant_for_range(next_row, 0, next_row, #next_line)

      if
        not is_inside_verbatim(current_node)
        and not is_inside_verbatim(next_node)
      then
        local indent, rest = next_line:match("^(%s*)(.*)$")

        lines[i] = before
        lines[i + 1] = indent .. letter .. "~" .. rest
      end
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end

vim.keymap.set(
  "n",
  "<leader>tp",
  PolishTypoFixTS,
  { noremap = true, silent = false, desc = "Fix Polish LaTeX typography" }
)
