local M = {
	setup = function(id)
		require('config.triggers.common').setup()

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lspconfig = require('lspconfig')
		lspconfig.ols.setup {capabilites = capabilities}

		vim.api.nvim_command("LspStart")
		vim.api.nvim_del_autocmd(id)
	end
}

return M
