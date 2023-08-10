Normal_insert_line = function()
	local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_lines(
		vim.api.nvim_win_get_buf(0), r, r, true, {''}
	)
end

Toggle_theme = function()
	local to_set = 'light'
	if vim.opt.bg._value == 'light' then to_set = 'dark' end
	vim.opt.bg = to_set

	local light_state_path = vim.fn.stdpath('data') .. '/theme_state'
	local fd = io.open(light_state_path, 'w')

	if not fd then
		return
	end

	fd.write(fd, to_set)
end

vim.keymap.set('n', '<leader>tt', Toggle_theme, {desc = 'Toggle light/dark theme'})

vim.keymap.set('n', '<leader>o',
	"<Cmd>lua local r,_ = unpack(vim.api.nvim_win_get_cursor(0)); vim.api.nvim_buf_set_lines(vim.api.nvim_win_get_buf(0), r-1, r-1, true, {''}) <CR>k",
	{desc = 'Insert new line'}
)
vim.keymap.set('n', '<leader>O', Normal_insert_line, {desc = 'Insert new line below'})

vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', {desc = 'Disable current highlight'})
vim.keymap.set({'n', 'v'}, 'Y', '"*y', {desc = 'Yank to system clipboard'})

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, {desc = 'Open diagnostics float window'})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'Go to previous diagnostic'})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = 'Go to next diagnostic'})
vim.keymap.set('n', '<space>dl', vim.diagnostic.setloclist, {desc = 'Open diagnostic window'})
vim.keymap.set('n', '<tab>', '<cmd>bn<cr>', {desc = 'Next buffer'})
vim.keymap.set('n', '<s-tab>', '<cmd>bp<cr>', {desc = 'Prev buffer'})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<leader>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
