require('config.triggers.common')

local lspconfig = require('lspconfig')
lspconfig.ccls.setup {
    init_options = {
        cache = {
            directory = "t:\\.ccls-cache"
        }
    },
}
