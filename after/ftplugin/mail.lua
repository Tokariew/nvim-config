local autocmd = vim.api.nvim_create_autocmd
vim.opt_local.fo = 'awq'
vim.opt_local.tw = 72
vim.opt_local.comments:append("nb:>")
vim.cmd([[match ErrorMsg '\s\+$']])
vim.api.nvim_clear_autocmds { group = "ThePrimeagen" }


autocmd('')
function Fixflowed()
        -- Save cursor position
        local pos = vim.fn.getpos(".")

        -- Add spaces to the end of every line
        vim.cmd([[silent! %s/\([^]> :]\)\n>[> ]*[^> ]/\1 /g]])

        -- Remove extraneous spaces
        vim.cmd([[silent! %s/ \+\n[> ]*$//]])

        -- Make sure there's only ONE space at the end of each line
        vim.cmd([[silent! %s/ \{2,}$/ /]])

        -- Fix the wockas spacing from the text
        vim.cmd([[silent! %s/^[> ]*>/ &/]])

        -- Compress the wockas
        while vim.fn.search('^>\\+ >', 'w') > 0 do
                vim.cmd([[s/^>\\+\\zs >/ >/]])
        end

        -- Restore the original cursor location
        vim.fn.setpos('.', pos)
end
