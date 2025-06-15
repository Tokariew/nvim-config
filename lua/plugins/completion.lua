return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets',
  'folke/lazydev.nvim'},

   version = '1.*',
  opts = {
    sources = {
      default = {'lazydev', 'lsp', 'path', 'snippets', 'buffer'},
        providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
      },
    },
  },
}
}
