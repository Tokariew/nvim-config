vim.pack.add({ "https://github.com/f3fora/nvim-texlabconfig" })

local bin_dir = vim.fn.expand("~/.local/bin")
local bin = vim.fs.joinpath(bin_dir, "nvim-texlabconfig")

local function plugin_path()
  return vim.fs.joinpath(
    vim.fn.stdpath("data"),
    "site",
    "pack",
    "core",
    "opt",
    "nvim-texlabconfig"
  )
end

local function build(force)
  if vim.fn.executable("go") ~= 1 then
    return
  end
  if not force and vim.fn.executable(bin) == 1 then
    return
  end
  vim.fn.mkdir(bin_dir, "p")
  local ftype = vim.fn.getftype(bin)
  if ftype ~= "" then
    vim.fn.delete(bin, ftype == "dir" and "rf" or "")
  end
  vim.system({ "go", "build", "-o", bin }, { cwd = plugin_path() }):wait()
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if
      name == "nvim-texlabconfig"
      and (kind == "install" or kind == "update")
    then
      pcall(build, true)
    end
  end,
})

pcall(build, false)

require("texlabconfig").setup()
