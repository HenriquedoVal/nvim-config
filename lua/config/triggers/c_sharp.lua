local M = {
	setup = function(id)
		require('config.triggers.common').setup()

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lspconfig = require('lspconfig')
		lspconfig.csharp_ls.setup {capabililtes = capabilities}

		vim.api.nvim_create_autocmd({"FileType"}, {
			pattern = {"cs"},
			command = ":map <c-b> :!dotnet build<cr>"
		})

		vim.cmd("nnoremap <buffer> <c-b> :!dotnet build<cr>")

		vim.api.nvim_command("LspStart")
		vim.api.nvim_del_autocmd(id)
	end
}

return M
