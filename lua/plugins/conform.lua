vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local by_ft, formatters = {}, {}
for _, file in
  ipairs(
    vim.fn.glob(
      vim.fn.stdpath("config") .. "/lua/formatters/*.lua",
      false,
      true
    )
  )
do
  local name = vim.fn.fnamemodify(file, ":t:r")
  local formatter = require("formatters." .. name)
  formatters[name] = formatter.config or {}
  for _, ft in ipairs(formatter.filetypes) do
    by_ft[ft] = by_ft[ft] or {}
    table.insert(by_ft[ft], name)
  end
end

require("conform").setup({
  formatters_by_ft = by_ft,
  formatters = formatters,
})

vim.keymap.set({ "n", "v" }, "<leader>fc", function()
  require("conform").format()
end, { desc = "[F]ormat with [c]onform" })
