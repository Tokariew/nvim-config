vim.pack.add({
  {
    src = "https://github.com/obsidian-nvim/obsidian.nvim",
    version = vim.version.range("*"),
  },
})

-- Only register workspaces whose directory actually exists, so missing
-- vaults never throw during setup.
local vaults = {
  { name = "personal", path = "~/vaults/personal" },
  { name = "work", path = "~/vaults/work" },
}

local workspaces = {}
for _, ws in ipairs(vaults) do
  if vim.fn.isdirectory(vim.fn.expand(ws.path)) == 1 then
    table.insert(workspaces, ws)
  end
end

require("obsidian").setup({
  legacy_commands = false, -- this will be removed in the next major release
  ui = {
    enable = false,
  },
  workspaces = workspaces,
})
