require('config.triggers.common')

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.pylsp.setup {
    settings = { pylsp = { plugins = {
        pycodestyle = {
            enabled = false
        },
        mccabe = {
            enabled = false
        },
        pyflakes = {
            enabled = false
        },
        flake8 = {
            enabled = true
        }
    }}},
    -- capabilities = capabilities
}

-- Will set for the next py files
-- vim.api.nvim_create_autocmd({"FileType"}, {
--     pattern = {"python"},
--     command = ":map <c-b> :pyfile %<cr>"
-- })
--
-- -- ... for the current
-- vim.cmd("nnoremap <buffer> <c-b> :pyfile %<cr>")

pcall(vim.api.nvim_command, "LspStart")
