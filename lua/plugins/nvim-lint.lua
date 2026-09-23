vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")
lint.linters_by_ft = {}
for _, file in
  ipairs(
    vim.fn.glob(vim.fn.stdpath("config") .. "/lua/linters/*.lua", false, true)
  )
do
  local name = vim.fn.fnamemodify(file, ":t:r")
  local linter = require("linters." .. name)
  if linter.config then
    lint.linters[name] =
      vim.tbl_extend("force", lint.linters[name], linter.config)
  end
  for _, ft in ipairs(linter.filetypes) do
    lint.linters_by_ft[ft] = lint.linters_by_ft[ft] or {}
    table.insert(lint.linters_by_ft[ft], name)
  end
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("lint", { clear = true }),
  callback = function()
    if vim.bo.buftype == "" and vim.bo.modifiable then
      lint.try_lint()
    end
  end,
})
vim.keymap.set("n", "<leader>ft", lint.try_lint, { desc = "Run linters" })
