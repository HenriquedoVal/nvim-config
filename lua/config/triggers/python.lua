local M = {
	setup = function(id)
		require('config.triggers.common').setup()

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lspconfig = require('lspconfig')

		lspconfig.pylsp.setup {
			cmd = { 'C:\\Users\\henri\\Dev\\python\\venvs\\lsp\\Scripts\\pylsp.exe' },

			-- Totally gave on setting flake8
			-- configurationSources = { 'flake8' },
			-- plugins = {
			-- 	flake8 = {
			-- 		enabled = true,
			-- 		executable = 'C:\\Users\\henri\\Dev\\python\\venvs\\lsp\\Scripts\\flake8.exe'
			-- 	},
			-- 	pycodestyle = { enabled = false },
			-- 	mccabe = { enabled = false },
			-- 	pyflakes = { enabled = false }
			-- },

			capabilities = capabilities
		}

		vim.api.nvim_command("LspStart")
		vim.api.nvim_del_autocmd(id)
	end
}

return M