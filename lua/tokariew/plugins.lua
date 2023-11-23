local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "brenoprata10/nvim-highlight-colors",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  "navarasu/onedark.nvim",
  "tpope/vim-sleuth",
  'L3MON4D3/cmp_luasnip',
  'dhruvasagar/vim-table-mode',
  'folke/trouble.nvim',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'mfussenegger/nvim-lint',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'jiaoshijie/undotree',
  'lewis6991/gitsigns.nvim',
  'nvim-telescope/telescope-symbols.nvim',
  'nvim-treesitter/playground',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'vimwiki/vimwiki',
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async', },

  },
  {
    'f3fora/nvim-texlabconfig',
    config = function()
      require('texlabconfig').setup()
    end,
    ft = { 'tex', 'bib' }, -- Lazy-load on filetype
    build = 'go build'
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      "rafamadriz/friendly-snippets",
      "benfowler/telescope-luasnip.nvim",
    },
  },
  { 'folke/which-key.nvim', opts = {} },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- { 'j-hui/fidget.nvim', opts = {}, tag = "legacy" },
      'folke/neodev.nvim',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
})


vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.o.completeopt = 'menuone,noselect'

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
