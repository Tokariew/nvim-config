vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

require("mason").setup({})

local tools = {
  "bash-language-server",
  "debugpy",
  "fish-lsp",
  "jq",
  "json-lsp",
  "latexindent",
  "ltex-ls-plus",
  "lua-language-server",
  "mmdc",
  "prettierd",
  "pyright",
  "ruff",
  "rumdl",
  "shellcheck",
  "shfmt",
  "stylelint",
  "stylua",
  "taplo",
  "texlab",
  "tinymist",
  "ty",
}

local function install_tools()
  local registry = require("mason-registry")

  registry.refresh(function()
    for _, name in ipairs(tools) do
      local ok, pkg = pcall(registry.get_package, name)

      if not ok then
        vim.schedule(function()
          vim.notify("Mason package not found: " .. name, vim.log.levels.WARN)
        end)
      elseif not pkg:is_installed() and not pkg:is_installing() then
        pkg:install()
      end
    end
  end)
end

install_tools()
