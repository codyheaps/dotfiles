-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- prevent comment from being inserted when entering new line in existing comment
vim.api.nvim_create_autocmd('BufEnter',
{
    callback = function()
        -- allow <CR> to continue block comments only
        vim.opt.comments:remove('://')
        vim.opt.comments:remove(':--')
        vim.opt.comments:remove(':#')
        vim.opt.comments:remove(':%')
    end,
})

vim.api.nvim_command("hi! CursorLine guifg=none guibg=#303030")
