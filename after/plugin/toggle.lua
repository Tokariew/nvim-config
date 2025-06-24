-- Persistent state storage
local list_toggle_state = {
  enabled = nil,
  list = nil,
  listchars = nil,
  diagnostics_virtual_text = nil,
  inlay_hints_enabled = nil,
}

function ToggleWhitespaceDisplay()
  local bufnr = vim.api.nvim_get_current_buf()

  -- First-time state capture
  if list_toggle_state.enabled == nil then
    list_toggle_state.enabled = vim.o.list
    list_toggle_state.list = vim.o.list
    list_toggle_state.listchars = vim.o.listchars
    list_toggle_state.diagnostics_virtual_text = vim.diagnostic.config().virtual_text

    -- Safe check for inlay hints
    if vim.lsp.inlay_hint and vim.lsp.inlay_hint.is_enabled then
      local ok, enabled = pcall(vim.lsp.inlay_hint.is_enabled, { bufnr = bufnr })
      if ok then
        list_toggle_state.inlay_hints_enabled = enabled
      else
        list_toggle_state.inlay_hints_enabled = false
      end
    end
  end

  if vim.o.list then
    -- Disable whitespace and LSP info
    vim.o.list = false
    vim.o.listchars = ""
    vim.cmd("silent! IBLToggle")

    vim.diagnostic.config({ virtual_text = false })
    if vim.lsp.inlay_hint then
      pcall(vim.lsp.inlay_hint.enable, false, { bufnr = bufnr })
    end

    print("Whitespace and LSP inline info disabled")
  else
    -- Restore state
    vim.o.list = list_toggle_state.list
    vim.o.listchars = list_toggle_state.listchars
    vim.cmd("silent! IBLToggle")

    vim.diagnostic.config({ virtual_text = list_toggle_state.diagnostics_virtual_text })
    if vim.lsp.inlay_hint and list_toggle_state.inlay_hints_enabled ~= nil then
      pcall(vim.lsp.inlay_hint.enable, list_toggle_state.inlay_hints_enabled, { bufnr = bufnr })
    end

    print("Whitespace and LSP inline info restored")
  end
end

vim.keymap.set("n", "<leader>tw", ToggleWhitespaceDisplay, { desc = "Toggle whitespace + LSP info" })
