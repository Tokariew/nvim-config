local parsers = {
  "asm",
  "bash",
  "bibtex",
  "c",
  "cpp",
  "css",
  "csv",
  "d",
  "desktop",
  "diff",
  "dockerfile",
  "fish",
  "git_config",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "html",
  "hyprlang",
  "ini",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "kdl",
  "latex",
  "lua",
  "luadoc",
  "luap",
  "make",
  "markdown",
  "markdown_inline",
  "mermaid",
  "muttrc",
  "ninja",
  "nginx",
  "nix",
  "pem",
  "php",
  "printf",
  "python",
  "query",
  "regex",
  "rst",
  "ruby",
  "toml",
  "tsx",
  "typescript",
  "typst",
  "vim",
  "vimdoc",
  "xml",
  "xresources",
  "yaml",
  "zathurarc",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ts = require("nvim-treesitter")

      -- Keep your old vimwiki -> markdown parser mapping
      vim.treesitter.language.register("markdown", "vimwiki")

      local available = {}
      for _, lang in ipairs(ts.get_available()) do
        available[lang] = true
      end

      local wanted = {}
      for _, lang in ipairs(parsers) do
        if available[lang] then
          wanted[#wanted + 1] = lang
        end
      end

      local installed = {}
      for _, lang in ipairs(ts.get_installed()) do
        installed[lang] = true
      end

      local missing = {}
      for _, lang in ipairs(wanted) do
        if not installed[lang] then
          missing[#missing + 1] = lang
        end
      end

      if #missing > 0 then
        ts.install(missing, { summary = true })
      end

      local group = vim.api.nvim_create_augroup("user-treesitter", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "*",
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft

          if not available[lang] then
            return
          end

          local ok = pcall(vim.treesitter.start, args.buf, lang)
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
