local M = {
	setup = function(id)
		require('config.triggers.common').setup()

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lspconfig = require('lspconfig')
		lspconfig.csharp_ls.setup {capabililtes = capabilities}

		vim.api.nvim_command("autocmd FileType cs nnoremap <buffer> <C-b> :!dotnet build<CR>")
		vim.api.nvim_command("LspStart")
		vim.api.nvim_del_autocmd(id)
	end
}

return M
