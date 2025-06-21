vim.lsp.config(
  'texlab', {
    settings = {
      texlab = {
        build = {
          executuble = 'latexmk',
          args = { "-lualatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
          onSave = false,
          forwardSearchAfter = false,
        },
        latexindent = {
          ["local"] = '/home/' .. os.getenv('USER') .. '/.config/latexindent.yaml',
          modifyLineBreaks = true,
        },
        forwardSearch = {
          executuble = "zathura",
          args = {
            '--synctex-editor-command',
            [[nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server]] .. vim.v.servername,
            '--synctex-forward',
            '%l:1:%f',
            '%p'
          },
        },
      }
    }
  }
)
