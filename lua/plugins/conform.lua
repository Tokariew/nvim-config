vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local by_ft, formatters, timeouts = {}, {}, {}

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

    if formatter.timeout_ms then
      timeouts[ft] = math.max(timeouts[ft] or 0, formatter.timeout_ms)
    end
  end
end

require("conform").setup({
  formatters_by_ft = by_ft,
  formatters = formatters,
})

vim.keymap.set({ "n", "v" }, "<leader>fc", function()
  require("conform").format({
    timeout_ms = timeouts[vim.bo.filetype] or 1000,
  })
end, { desc = "[F]ormat with [c]onform" })
