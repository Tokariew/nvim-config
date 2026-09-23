local EMOJI_URL =
  "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json"
local JQ_FILTER = '.[] | "\\(.emoji) :\\(.aliases[0]): \\(.tags)"'

local function update_emoji_list()
  local target = vim.fn.stdpath("config") .. "/utils/emoji-list"

  local curl = vim.system({ "curl", "-s", EMOJI_URL }):wait()
  if curl.code ~= 0 then
    vim.notify(
      "update_emoji_list: curl failed: " .. curl.stderr,
      vim.log.levels.ERROR,
      { title = "Emoji list" }
    )
    return false
  end

  local jq = vim
    .system({ "jq", "-r", JQ_FILTER }, { stdin = curl.stdout })
    :wait()
  if jq.code ~= 0 then
    vim.notify(
      "update_emoji_list: jq failed: " .. jq.stderr,
      vim.log.levels.ERROR,
      { title = "Emoji list" }
    )
    return false
  end

  local f = assert(io.open(target, "w"))
  f:write(jq.stdout)
  f:close()

  vim.notify(
    "Updated " .. target .. " (" .. #vim.split(jq.stdout, "\n") .. " entries)",
    vim.log.levels.INFO,
    { title = "Emoji list" }
  )
  return true
end

vim.api.nvim_create_user_command("UpdateEmojiList", function()
  update_emoji_list()
end, { desc = "Update utils/emoji-list from GitHub gemoji" })
