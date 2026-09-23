vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })

local opts = {
  style = "night",
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
}

require("tokyonight").setup(opts)
vim.cmd.colorscheme("tokyonight")
