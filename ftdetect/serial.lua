vim.filetype.add({
  pattern = {
    ["serial.*.txt"] = "dupnyserial",
    [".*xxxx/config.conf"] = "config",
  },
})
