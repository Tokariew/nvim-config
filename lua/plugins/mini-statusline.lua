vim.pack.add({ "https://github.com/echasnovski/mini.statusline" })

local statusline = require("mini.statusline")
statusline.setup()

statusline.section_location = function()
  return "%2l:%-2v"
end

local original_section_lsp = statusline.section_lsp

statusline.section_lsp = function(args)
  local lsp = original_section_lsp(args)
  local progress = vim.ui.progress_status()

  if progress == "" then
    return lsp
  end

  return lsp == "" and progress or lsp .. " " .. progress
end
