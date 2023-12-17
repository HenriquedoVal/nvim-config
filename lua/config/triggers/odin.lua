local M = {
	setup = function(id)
		require('config.triggers.common')

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lspconfig = require('lspconfig')
		lspconfig.ols.setup {capabilites = capabilities}

		vim.api.nvim_create_autocmd({"FileType"}, {
			pattern = {"odin"},
			command = ":map <c-b> :!odin run %:h<cr>"
		})

		vim.api.nvim_command(
			"nnoremap <buffer> <C-b> :!odin run %:h<CR>"
		)

		pcall(vim.api.nvim_command, "LspStart")
		pcall(vim.api.nvim_del_autocmd, id)
	end
}

return M
