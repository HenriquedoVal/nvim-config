-- `gF` to work in `/some/path:23` on Windows
vim.opt.isfname:remove { ':' }

-- Better :fin somefile
vim.opt.path:append { '**' }

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Same statusline over windows
vim.opt.laststatus = 3

-- Supress intro message
vim.opt.shortmess:append('I')

-- Use 'cmp' completion float instead of native
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.ignorecase = true

-- `:h shell-powershell` modified
vim.cmd [[
	let &shell = 'pwsh'
	let &shellcmdflag = '-NoLogo -NoProfile -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';$PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;'
	let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
	set shellquote= shellxquote=
]]

-- Hard hit on loading Python and Js files
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

-- Fixed column for lsp signs
-- vim.wo.signcolumn = "yes"

vim.g.did_install_default_menus = 1

local light_state_path = vim.fn.stdpath('data') .. '/theme_state'
local fd = io.open(light_state_path, 'r')

if not fd then
	return
end

local is_light = fd.read(fd, '*a') == 'light'
if is_light then
	vim.opt.bg = 'light'
end
