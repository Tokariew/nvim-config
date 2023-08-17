require('onedark').setup {
    style = 'deep',
    transparent = true,
    terminal_colors = true,
    ending_tildes = true,
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    lualine = {
        transparent = true,
    },
    highlights = {
        ["@parameter"] = { fmt = 'italic', },
        ["@class_definition"] = { fmt = 'underline' },
    },
    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
}
require('onedark').load()

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
require("notify").setup({
    background_colour = "#000000",
})
