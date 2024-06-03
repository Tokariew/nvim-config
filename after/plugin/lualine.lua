local function getWords()
  return '' .. tostring(vim.fn.wordcount().words)
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { {
      'filename',
      symbols = {
        modified = '[+]',
        readonly = '',
        unnamed = '[No name]',
        newfile = '',
      },
    },
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { { getWords } },
    lualine_z = { 'selectioncount', 'progress', '%l:%c' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    lualine_a = { { 'buffers', mode = 2 } },
    lualine_y = { {
      require("noice").api.status.message.get_hl,
      cond = require("noice").api.status.message.has,
    },
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = "#ff9e64" },
      },
      {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        color = { fg = "#ff9e64" },
      },
      {
        require("noice").api.status.search.get,
        cond = require("noice").api.status.search.has,
        color = { fg = "#ff9e64" },
      }, },

  },
  inactive_winbar = { lualine_a = { { 'buffers', mode = 2 } }, },
  extensions = {}
}
