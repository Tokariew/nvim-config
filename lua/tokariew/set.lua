vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.encoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.clipboard = 'unnamedplus'

vim.g.loaded_spellfile_plugin = 1
vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell/"
vim.opt.spelllang = { "en_gb", "pl" }
vim.opt.spell = true
vim.opt.spellsuggest = 'best,20'

vim.opt.list = true
vim.opt.listchars = "tab:→ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»"

vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("XDG_DATA_HOME") .. "/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.o.termguicolors = true

vim.opt.scrolloff = 8
vim.wo.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.colorcolumn = "-2"

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
