-- General
vim.g.mapleader = " "
vim.o.mouse = "a"
vim.o.switchbuf = "usetab"
vim.o.undofile = true
vim.o.clipboard = "unnamedplus"

-- UI

vim.o.breakindent = true
vim.o.breakindentopt = "list:-1"
vim.o.colorcolumn = "-2"
vim.opt.completeopt:append("popup")
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.pumborder = "single"
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shortmess = "CFOSWaco"
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.winborder = "rounded"
vim.o.wrap = true
vim.opt.listchars =
  "tab:→ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»"
vim.opt.fillchars:append({
  horiz = "━",
  horizdown = "┳",
  horizup = "┻",
  msgsep = "━",
  vert = "┃",
  verthoriz = "╋",
  vertleft = "┫",
  vertright = "┣",
})

vim.o.laststatus = 3

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

-- Editing

vim.o.autoindent = true
vim.o.expandtab = true
vim.o.formatoptions = "rqnl1j"
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.spelloptions = "camel"
vim.o.tabstop = 4
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
vim.o.completetimeout = 100

vim.o.swapfile = false
vim.o.backup = false
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Folding via treesitter
vim.opt.foldlevel = 90
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
