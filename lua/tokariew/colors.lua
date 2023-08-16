require('onedark').setup {
    style = 'deep',
    transparent = true,
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    highlights = {
        ["@parameter"] = { fmt = 'italic', },
        ["@class_definition"] = { fmt = 'underline' },
    }
}
require('onedark').load()

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
