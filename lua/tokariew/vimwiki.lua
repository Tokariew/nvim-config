vim.g.vimwiki_list = {
  {
    path = '~/Documents/vimwiki/',
    path_html = '~/Documents/wiki-html/'
  }
}

vim.g.vimwiki_listsyms = '✗○◐●✓'
vim.g.vimwiki_global_ext = 0

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  pattern = "diary.wiki",
  command = ":VimwikiDiaryGenerateLinks",
}
)
