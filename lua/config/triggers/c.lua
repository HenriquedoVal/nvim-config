require('config.triggers.common')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.ccls.setup {
    init_options = {
        cache = {
            directory = "t:\\.ccls-cache"
        }
    },
    capabililtes = capabilities
}

vim.api.nvim_set_keymap(
    '', '<c-b>', ':term cl main.c && .\\main<cr>', {
        desc = 'Build and run `main.c` using `cl.exe`'
    }
)

pcall(vim.api.nvim_command, "LspStart")
