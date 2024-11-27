require('config.triggers.common')

-- require('lspconfig').eslint.setup {}

vim.api.nvim_command(
	"nnoremap <buffer> <C-b> :!node %<CR>"
)

pcall(vim.api.nvim_command, "LspStart")
