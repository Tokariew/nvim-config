local fzf = require("fzf-lua")

local function insert_emoji()
  fzf.fzf_exec("cat ~/.config/nvim/utils/*list", {
    prompt = "Emoji> ",
    previewer = false,
    actions = {
      ["default"] = function(selected)
        local emoji = selected[1]:match("^%S+")
        vim.api.nvim_put({ emoji }, "c", true, true)
      end,
    },
  })
end

vim.keymap.set(
  "n",
  "<leader>ss",
  insert_emoji,
  { desc = "Insert Emoji or Gitmoji" }
)
