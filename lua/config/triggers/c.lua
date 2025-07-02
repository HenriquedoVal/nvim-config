require('config.triggers.common')

local lspconfig = require('lspconfig')
lspconfig.ccls.setup({
    on_attach = function (client, bufnr)
        -- client.server_capabilities.semanticTokensProvider = nil
    end,
    init_options = {
        cache = {
            directory = "t:\\.ccls-cache"
        }
    },
})

pcall(vim.api.nvim_command, 'LspStart')
