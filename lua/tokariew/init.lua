require("tokariew.set")
require("tokariew.vimwiki") -- vimwiki being stupid and require to be set before plugin loading
require("tokariew.plugins")
require("tokariew.colors")
require("tokariew.remap")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

local save_group = augroup('AutoSave', {})

autocmd({ "BufWritePre" }, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ 'InsertLeave', 'TextChanged', 'FocusLost' }, {
    group = save_group,
    pattern = "*",
    command = "silent! write",
})


