require('config.triggers.common')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.csharp_ls.setup {
    capabililtes = capabilities,
    on_attach = function (client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
    end
}

vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = {"cs"},
	command = ":map <c-b> :!dotnet build<cr>"
})

vim.cmd("nnoremap <buffer> <c-b> :!dotnet build<cr>")

pcall(vim.api.nvim_command, "LspStart")
