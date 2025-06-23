return {
  {
    'f3fora/nvim-texlabconfig',
    ft = { 'tex', 'bib' }, -- Lazy-load on filetype
    build = 'go build',
    opts = {},
    config = function ()
      require('texlabconfig').setup(config)
    end
  },

}
