-- Hightlight line number instead of showing sign on diagnostic error/warning
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.INFO]  = '',
            [vim.diagnostic.severity.HINT]  = '',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN]  = 'Question',
            [vim.diagnostic.severity.INFO]  = 'MoreMsg',
            [vim.diagnostic.severity.HINT]  = 'Identifier',
        }
    }
})

-- Set borders to lsp hover
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
local function _open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or 'single'
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
vim.lsp.util.open_floating_preview = _open_floating_preview

require('lspconfig.ui.windows').default_options = {
	border = 'single'
}

vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
	local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
	pcall(vim.diagnostic.reset, ns)
	return true
end
