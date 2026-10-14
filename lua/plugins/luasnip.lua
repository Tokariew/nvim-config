vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "LuaSnip" and (kind == "install" or kind == "update") then
      local result = vim
        .system({ "make", "install_jsregexp" }, { cwd = ev.data.path, text = true })
        :wait()
      if result.code ~= 0 then
        vim.notify(
          "LuaSnip jsregexp build failed: " .. result.stderr,
          vim.log.levels.WARN
        )
      end
    end
  end,
})

vim.pack.add({
  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    version = vim.version.range("2.*"),
  },
})

require("plugins.friendly-snippets")

require("luasnip").setup({})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { vim.fn.stdpath("config") .. "/snippets" },
})
require("luasnip.loaders.from_lua").lazy_load({
  paths = { vim.fn.stdpath("config") .. "/luasnippets" },
})
