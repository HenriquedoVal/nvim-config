local called = false

Bootstrap_setup = function()
	require('config.after.treesitter')
	require('config.after.cmp')
	require('config.after.lspconfig')
	require('config.after.lsp_signature')
end

local M = {
	setup = function()
		if not called then
			assert(called ~= nil, "Namespace?")
			called = true
			Bootstrap_setup()
		end
	end
}

return M
