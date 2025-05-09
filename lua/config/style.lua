local function set_color()
    vim.api.nvim_set_hl(0, 'ErrorMsg', { link = 'WarningMsg' })

    if vim.api.nvim_get_option_value('bg', { scope='global'}) == 'light' then
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#dddddd'})
    else
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#222222'})
    end
end

set_color()

vim.api.nvim_set_hl(0, 'PmenuKind', { link = 'Conditional'})
vim.api.nvim_set_hl(0, 'PmenuSel', { link = 'Include'})
vim.api.nvim_set_hl(0, 'PmenuKindSel', { link = 'Conditional'})
vim.api.nvim_set_hl(0, 'PmenuMatchSel', { link = 'Identifier'})

vim.api.nvim_create_autocmd('ColorScheme', { callback = set_color })
