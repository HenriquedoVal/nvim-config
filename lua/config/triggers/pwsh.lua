require('config.triggers.common')

local lspconfig = require('lspconfig')

local on_attach = function(client, _bufnr)
    client.server_capabilities.semanticTokensProvider = nil
end

local bundle_path = os.getenv('LOCALAPPDATA') .. '\\powershell_es'
local pwsh_es = lspconfig["powershell_es"]
pwsh_es.setup {
    bundle_path = bundle_path,
    filetypes = { 'ps1', 'psm1', 'psd1' },
    on_attach = on_attach
}


pcall(vim.api.nvim_command, "LspStart")
