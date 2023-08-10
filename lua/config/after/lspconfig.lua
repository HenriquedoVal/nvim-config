-- Hightlight line number instead of showing sign on lsp error/warning
vim.cmd [[
  highlight! DiagnosticLineNrError  guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn   guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo   guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint   guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn  text= texthl=DiagnosticSignWarn  linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo  text= texthl=DiagnosticSignInfo  linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint  text= texthl=DiagnosticSignHint  linehl= numhl=DiagnosticLineNrHint
]]

-- Set borders to lsp hover
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or 'single'
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require('lspconfig.ui.windows').default_options = {
	border = 'single'
}

vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
	local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
	pcall(vim.diagnostic.reset, ns)
	return true
end
