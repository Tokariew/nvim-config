--vim.o.messagesopt = vim.o.messagesopt .. ",timeout:4000,maxheight:50"

require("vim._core.ui2").enable({
  enable = true,
  msg = {
    targets = "cmd",
    dialog = { height = 0.5 },
    msg = { height = 0.5, timeout = 4000 },
    pager = { height = 1 },
  },
})
