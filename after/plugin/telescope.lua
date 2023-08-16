require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

-- Enable telescope fzf native, if installed
require('telescope').load_extension('fzf')
require("telescope").load_extension('luasnip')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sn', ":Telescope luasnip<CR>", { desc = '[S]earch S[n]ippet' })

vim.keymap.set('n', '<leader>se', function()
  require 'telescope.builtin'.grep_string { shorten_path = true, word_match = "-w", only_sort_text = true, search = '' }
end, { desc = '[S]earch by fuzzy gr[e]p' })
vim.keymap.set('n', '<leader>ss', function()
  require 'telescope.builtin'.symbols { sources = { 'emoji', 'kaomoji', 'gitmoji' } }
end, { desc = "[S]earch [s]ymbols" })
