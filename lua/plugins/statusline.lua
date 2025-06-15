return {
  {
    'echasnovski/mini.statusline',
    dependencies = {
      "echasnovski/mini.icons",
      "echasnovski/mini.tabline",
    },
    event = "VeryLazy",
    opts = function()
      local statusline = require("mini.statusline")
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end
  }
}
