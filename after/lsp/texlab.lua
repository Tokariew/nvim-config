local user = os.getenv("USER")
local latex_engine = (user == "tokariew") and "-lualatex" or "-pdf"

vim.lsp.config("texlab", {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { latex_engine, "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = false,
        forwardSearchAfter = false,
      },
      latexindent = {
        ["local"] = "/home/" .. user .. "/.config/latexindent.yaml",
        modifyLineBreaks = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = {
          "--synctex-editor-command",
          [[nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]]
            .. vim.v.servername,
          "--synctex-forward",
          "%l:1:%f",
          "%p",
        },
      },
    },
  },
})
