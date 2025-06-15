return {
  'jiaoshijie/undotree',
  dependencies = "nvim-lua/plenary.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      winblend = 0,
    },
  },
  keys = {
    { "<F6>", "<cmd>lua require('undotree').toggle()<cr>" },
  }
}
