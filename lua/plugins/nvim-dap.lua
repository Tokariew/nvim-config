vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
})

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})
vim.fn.sign_define("DapBreakpointRejected", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})
vim.fn.sign_define("DapStopped", {
  text = "",
  texthl = "DiagnosticSignWarn",
  linehl = "Visual",
  numhl = "DiagnosticSignWarn",
})

local vscode = require("dap.ext.vscode")
local json = require("plenary.json")
vscode.json_decode = function(str)
  return vim.json.decode(json.json_strip_comments(str))
end

local dap = require("dap")
local dapui = require("dapui")

dapui.setup({})
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

require("nvim-dap-virtual-text").setup({})

vim.keymap.set("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "[D]ap [B]reakpoint" })
vim.keymap.set("n", "<leader>dc", function()
  dap.continue()
end, { desc = "[D]ap [c]ontinue" })
vim.keymap.set("n", "<leader>do", function()
  dap.step_over()
end, { desc = "[D]ap step [o]ver" })
vim.keymap.set("n", "<leader>di", function()
  dap.step_into()
end, { desc = "[D]ap step [i]nto" })
vim.keymap.set("n", "<leader>dO", function()
  dap.step_out()
end, { desc = "[D]ap step [O]ut" })
vim.keymap.set("n", "<leader>dq", function()
  dap.terminate()
end, { desc = "[D]ap [Q]uit" })
vim.keymap.set("n", "<leader>du", function()
  dapui.toggle({})
end, { desc = "[D]ap [U]I" })
vim.keymap.set({ "n", "v" }, "<leader>de", function()
  dapui.eval()
end, { desc = "Dap [E]val" })
