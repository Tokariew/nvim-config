return {
  cmd = { "ltex-ls-plus" },
  filetypes = { "markdown", "tex", "plaintex" },
  root_markers = { ".git" },

  get_language_id = function(_, filetype)
    if filetype == "tex" or filetype == "plaintex" then
      return "latex"
    end
    return filetype
  end,

  settings = {
    ltex = {
      enabled = { "markdown", "latex" },
      language = "auto",

      dictionary = {
        ["en-GB"] = { "Neovim", "Lua" },
        ["pl-PL"] = { "Neovim", "Lua" },
      },
    },
  },
}
