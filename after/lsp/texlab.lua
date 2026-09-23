local user = os.getenv("USER")
local latex_engine = (user == "tokariew") and "-lualatex" or "-pdf"

return {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { latex_engine, "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = false,
        forwardSearchAfter = false,
      },
      latexindent = {
        ["local"] = vim.fn.expand("~/.config/latexindent.yaml"),
        modifyLineBreaks = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = {
          "--synctex-editor-command",
          vim.fn.shellescape(
            vim.fs.joinpath(vim.fn.expand("~/.local/bin"), "nvim-texlabconfig")
          )
            .. [[ -file '%%%{input}' -line %%%{line} -server ]]
            .. vim.fn.shellescape(vim.v.servername),
          "--synctex-forward",
          "%l:1:%f",
          "%p",
        },
      },
    },
  },
}
