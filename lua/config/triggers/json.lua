local M = {
	setup = function(id)
        require('config.after.treesitter')
		pcall(vim.api.nvim_del_autocmd, id)
	end
}

return M
