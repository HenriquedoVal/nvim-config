vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autowrite = true
vim.opt.makeprg = 'make -j'
vim.opt.ignorecase = true
vim.opt.shortmess:append('I') -- Supress intro message
vim.opt.isfname:remove(':')   -- `gF` to work in `/some/path:23` on Windows
vim.opt.path:append('**')     -- Better :fin somefile
vim.opt.laststatus = 3
-- vim.lsp.set_log_level("off")

vim.opt.completeopt:append({'fuzzy', 'longest', 'preview'})
vim.opt.pumheight = 5  -- the ammount of completion results shown
vim.opt.pumblend = 10

vim.g.clipboard = 'win32yank'

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_alto = 1
vim.g.netrw_altv = 1
vim.g.netrw_browse_split = 4  -- act like "P" on <enter>
vim.g.netrw_sizestyle = "H"

-- Using py.exe will solve all virtualenv issues
-- just make sure to install pynvim on global python env
-- and build venvs with `--system-site-packages`
vim.g.python3_host_prog = "C:\\WINDOWS\\py.exe"

vim.g.node_host_prog = os.getenv('appdata') .. "/npm/node_modules/neovim/bin/cli.js"
