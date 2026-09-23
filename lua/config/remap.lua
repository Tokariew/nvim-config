-- Normal-mode remap helper.
-- nmap(keys, func, desc[, opts]) — extra opts are passed to vim.keymap.set.
local function nmap(keys, func, desc, opts)
  opts = vim.tbl_extend("keep", opts or {}, { desc = desc })
  vim.keymap.set("n", keys, func, opts)
end

-- Global remaps (moved from old tokariew/remap.lua)
nmap("<leader>q", ":wq<cr>")
nmap("<leader>Q", ":qa<cr>")
nmap("<leader>w", ":w<cr>")
nmap("<leader>bd", ":bd<cr>")
nmap("<leader><Tab>", ":bnext<cr>")
nmap("\\\\", ":let@/=''<cr>", nil, { silent = true })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

nmap("<leader>se", "<cmd>UpdateEmojiList<CR>", "Update emoji list")

-- Diagnostics at cursor (moved from plugins/lspconfig.lua)
nmap("<leader>dd", vim.diagnostic.open_float, "[D]iagnostics")

-- LSP buffer keymaps (moved from old after/plugin/lspattach.lua)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_keymaps", { clear = true }),
  callback = function(args)
    local bufnr = args.buf

    nmap(
      "<leader>rn",
      vim.lsp.buf.rename,
      "LSP: [R]e[n]ame",
      { buffer = bufnr }
    )
    nmap("<leader>ca", vim.lsp.buf.code_action, "LSP: [C]ode [A]ction", {
      buffer = bufnr,
    })
    nmap("gd", vim.lsp.buf.definition, "LSP: [G]oto [D]efinition", {
      buffer = bufnr,
    })
    nmap("<leader>ll", "<Cmd>lua vim.lsp.codelens.run()<CR>", "LSP: Lens", {
      buffer = bufnr,
    })
    nmap(
      "lR",
      "<Cmd>lua vim.lsp.buf.references()<CR>",
      "LSP: References",
      { buffer = bufnr }
    )
    nmap(
      "gr",
      require("fzf-lua").lsp_references,
      "LSP: [G]oto [R]eferences",
      { buffer = bufnr }
    )
    nmap("gI", vim.lsp.buf.implementation, "LSP: [G]oto [I]mplementation", {
      buffer = bufnr,
    })
    nmap(
      "<leader>D",
      vim.lsp.buf.type_definition,
      "LSP: Type [D]efinition",
      { buffer = bufnr }
    )
    nmap(
      "<leader>ds",
      require("fzf-lua").lsp_document_symbols,
      "LSP: [D]ocument [S]ymbols",
      { buffer = bufnr }
    )
    nmap(
      "<leader>ws",
      require("fzf-lua").lsp_workspace_symbols,
      "LSP: [W]orkspace [S]ymbols",
      { buffer = bufnr }
    )
    nmap("K", vim.lsp.buf.hover, "LSP: Hover Documentation", {
      buffer = bufnr,
    })
    nmap(
      "<C-k>",
      vim.lsp.buf.signature_help,
      "LSP: Signature Documentation",
      { buffer = bufnr }
    )
    nmap("gD", vim.lsp.buf.declaration, "LSP: [G]oto [D]eclaration", {
      buffer = bufnr,
    })
    nmap(
      "<leader>wa",
      vim.lsp.buf.add_workspace_folder,
      "LSP: [W]orkspace [A]dd Folder",
      { buffer = bufnr }
    )
    nmap(
      "<leader>wr",
      vim.lsp.buf.remove_workspace_folder,
      "LSP: [W]orkspace [R]emove Folder",
      { buffer = bufnr }
    )
    nmap("<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "LSP: [W]orkspace [L]ist Folders", { buffer = bufnr })
    nmap("<leader>fl", vim.lsp.buf.format, "LSP: [F]ormat with [L]sp", {
      buffer = bufnr,
    })
  end,
  desc = "LSP buffer keymaps",
})
