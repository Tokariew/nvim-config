vim.pack.add({ "https://github.com/sammaji/markdown-preview.nvim" })

local name = "markdown-preview.nvim"

local function ensure_binary()
  pcall(function()
    vim.cmd.packadd(name)
    if vim.fn["mkdp#util#server_ready"]() ~= 1 then
      vim.fn["mkdp#util#install_sync"](true)
    end
  end)
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local spec_name, kind = ev.data.spec.name, ev.data.kind
    if spec_name == name and (kind == "install" or kind == "update") then
      vim.opt.runtimepath:prepend(ev.data.path)
      ensure_binary()
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", { callback = ensure_binary })

vim.g.mkdp_filetypes = { "markdown" }
