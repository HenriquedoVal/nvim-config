local M = {
	setup = function(id)
		require('config.triggers.common')

		-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
		-- local lspconfig = require('lspconfig')
		-- lspconfig.ember.setup {capabilites = capabilities}
		--
		-- vim.api.nvim_create_autocmd({"FileType"}, {
		-- 	pattern = {"javascript"},
		-- 	command = ":map <c-b> :!node %<cr>"
		-- })

		vim.api.nvim_command(
			"nnoremap <buffer> <C-b> :!node %<CR>"
		)

		pcall(vim.api.nvim_command, "LspStart")
		pcall(vim.api.nvim_del_autocmd, id)
	end
}

return M
