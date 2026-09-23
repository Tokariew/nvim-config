vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

local function select_map(query)
  return function()
    require("nvim-treesitter-textobjects.select").select_textobject(
      query,
      "textobjects"
    )
  end
end

local function move_map(method, query)
  return function()
    require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
  end
end

local function swap_map(method, query)
  return function()
    require("nvim-treesitter-textobjects.swap")[method](query)
  end
end

require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
  },
  move = {
    set_jumps = true,
  },
})

vim.keymap.set(
  { "x", "o" },
  "aa",
  select_map("@parameter.outer"),
  { desc = "Parameter outer" }
)
vim.keymap.set(
  { "x", "o" },
  "ia",
  select_map("@parameter.inner"),
  { desc = "Parameter inner" }
)
vim.keymap.set(
  { "x", "o" },
  "af",
  select_map("@function.outer"),
  { desc = "Function outer" }
)
vim.keymap.set(
  { "x", "o" },
  "if",
  select_map("@function.inner"),
  { desc = "Function inner" }
)
vim.keymap.set(
  { "x", "o" },
  "ac",
  select_map("@class.outer"),
  { desc = "Class outer" }
)
vim.keymap.set(
  { "x", "o" },
  "ic",
  select_map("@class.inner"),
  { desc = "Class inner" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "]f",
  move_map("goto_next_start", "@function.outer"),
  { desc = "Next function start" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "]]",
  move_map("goto_next_start", "@class.outer"),
  { desc = "Next class start" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "]a",
  move_map("goto_next_start", "@parameter.inner"),
  { desc = "Next parameter start" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "]F",
  move_map("goto_next_end", "@function.outer"),
  { desc = "Next function end" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "][",
  move_map("goto_next_end", "@class.outer"),
  { desc = "Next class end" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "]A",
  move_map("goto_next_end", "@parameter.inner"),
  { desc = "Next parameter end" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "[f",
  move_map("goto_previous_start", "@function.outer"),
  { desc = "Previous function start" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "[[",
  move_map("goto_previous_start", "@class.outer"),
  { desc = "Previous class start" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "[a",
  move_map("goto_previous_start", "@parameter.inner"),
  { desc = "Previous parameter start" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "[F",
  move_map("goto_previous_end", "@function.outer"),
  { desc = "Previous function end" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "[]",
  move_map("goto_previous_end", "@class.outer"),
  { desc = "Previous class end" }
)
vim.keymap.set(
  { "n", "x", "o" },
  "[A",
  move_map("goto_previous_end", "@parameter.inner"),
  { desc = "Previous parameter end" }
)
vim.keymap.set(
  "n",
  "<leader>a",
  swap_map("swap_next", "@parameter.inner"),
  { desc = "Swap next parameter" }
)
vim.keymap.set(
  "n",
  "<leader>A",
  swap_map("swap_previous", "@parameter.inner"),
  { desc = "Swap previous parameter" }
)
