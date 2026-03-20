local function select_map(query)
  return function()
    require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
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

return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter-textobjects").setup(opts)
    end,
    keys = {
      { "aa", select_map("@parameter.outer"), mode = { "x", "o" }, desc = "Parameter outer" },
      { "ia", select_map("@parameter.inner"), mode = { "x", "o" }, desc = "Parameter inner" },
      { "af", select_map("@function.outer"), mode = { "x", "o" }, desc = "Function outer" },
      { "if", select_map("@function.inner"), mode = { "x", "o" }, desc = "Function inner" },
      { "ac", select_map("@class.outer"), mode = { "x", "o" }, desc = "Class outer" },
      { "ic", select_map("@class.inner"), mode = { "x", "o" }, desc = "Class inner" },

      { "]f", move_map("goto_next_start", "@function.outer"), mode = { "n", "x", "o" }, desc = "Next function start" },
      { "]]", move_map("goto_next_start", "@class.outer"), mode = { "n", "x", "o" }, desc = "Next class start" },
      { "]a", move_map("goto_next_start", "@parameter.inner"), mode = { "n", "x", "o" }, desc = "Next parameter start" },

      { "]F", move_map("goto_next_end", "@function.outer"), mode = { "n", "x", "o" }, desc = "Next function end" },
      { "][", move_map("goto_next_end", "@class.outer"), mode = { "n", "x", "o" }, desc = "Next class end" },
      { "]A", move_map("goto_next_end", "@parameter.inner"), mode = { "n", "x", "o" }, desc = "Next parameter end" },

      { "[f", move_map("goto_previous_start", "@function.outer"), mode = { "n", "x", "o" }, desc = "Previous function start" },
      { "[[", move_map("goto_previous_start", "@class.outer"), mode = { "n", "x", "o" }, desc = "Previous class start" },
      { "[a", move_map("goto_previous_start", "@parameter.inner"), mode = { "n", "x", "o" }, desc = "Previous parameter start" },

      { "[F", move_map("goto_previous_end", "@function.outer"), mode = { "n", "x", "o" }, desc = "Previous function end" },
      { "[]", move_map("goto_previous_end", "@class.outer"), mode = { "n", "x", "o" }, desc = "Previous class end" },
      { "[A", move_map("goto_previous_end", "@parameter.inner"), mode = { "n", "x", "o" }, desc = "Previous parameter end" },

      { "<leader>a", swap_map("swap_next", "@parameter.inner"), mode = "n", desc = "Swap next parameter" },
      { "<leader>A", swap_map("swap_previous", "@parameter.inner"), mode = "n", desc = "Swap previous parameter" },
    },
  },
}
