require('lspconfig')['texlab'].setup {
  settings = {
    texlab = {
      build = {
        executable = 'latexmk',
        args = { "-pv", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = false,
        forwardSearchAfter = false,
      },
      forwardSearch = {
        executable = '/home/tokariew/Applications/Sioyek-x86_64_ac775a0947e488c85c5b6d9c677944d9.AppImage',
        args = {
          "--forward-search-file",
          "%f",
          "--forward-search-line",
          "%l",
          "%p",
        },
      },
    }
  }
}

vim.keymap.set("n", "<leader>t", ":TexlabBuild<CR>:TexlabForward<CR>")
