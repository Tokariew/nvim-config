return
{
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0,
    cmd = { "TSupdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>",      desc = "Decrement Selection", mode = "x" },
    },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "markdown",
        "markdown_inline",
        "python",
        "bibtex",
        "latex",
        "python",
        "diff",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-a>",
          node_incremental = "grn",
          scope_incremental = "<c-s>",
          node_decremental = "<M-space>"
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { [']f'] = "@function.outer", [']]'] = '@class.outer', [']a'] = '@parameter.inner' },
          goto_next_end = { [']F'] = "@function.outer", [']['] = '@class.outer', [']A'] = '@parameter.inner' },
          goto_previous_start = { ['[f'] = "@function.outer", ['[['] = '@class.outer', ['[a'] = '@parameter.inner' },
          goto_previous_end = { ['[F'] = "@function.outer", ['[]'] = '@class.outer', ['[A'] = '@parameter.inner' },
        },
        swap = {
          enable = true,
          swap_next = { ['<leader>a'] = '@parameter.inner', },
          swap_previous = { ['<leader>A'] = '@parameter.inner', },

        },
      },
    },
      config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)
      end
  },
}
