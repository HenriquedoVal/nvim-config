vim.opt.isfname:remove { ':' }
vim.opt.path:append { '**' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.shortmess:append('I')
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.ignorecase = true
vim.opt.shell = 'pwsh'

vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

-- Fixed column for lsp signs
-- vim.wo.signcolumn = "yes"

vim.g.did_install_default_menus = 1

