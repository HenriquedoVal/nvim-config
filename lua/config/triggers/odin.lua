require('config.triggers.common')

local lspconfig = require('lspconfig')
lspconfig.ols.setup { }

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"odin"},
    command = ":map <c-b> :!odin run %:h<cr>"
})

vim.api.nvim_command(
    "nnoremap <buffer> <C-b> :!odin run %:h<CR>"
)

pcall(vim.api.nvim_command, "LspStart")
