require('config.triggers.common')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig["powershell_es"].setup {
    bundle_path = os.getenv('LOCALAPPDATA')..'\\powershell_es',
    filetypes = { 'ps1', 'psm1', 'psd1' },
    capabilities = capabilities
}

pcall(vim.api.nvim_command, "LspStart")
