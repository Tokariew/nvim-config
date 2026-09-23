local fzf = require("fzf-lua")

local function insert_emoji()
  local symbols = {}
  for _, file in
    ipairs(vim.fn.glob(vim.fn.stdpath("config") .. "/utils/*list", false, true))
  do
    vim.list_extend(symbols, vim.fn.readfile(file))
  end
  fzf.fzf_exec(symbols, {
    prompt = "Emoji> ",
    previewer = false,
    actions = {
      ["default"] = function(selected)
        if not selected or not selected[1] then
          return
        end
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
