-- `gF` to work in `/some/path:23` on Windows
vim.opt.isfname:remove { ':' }

-- Better :fin somefile
vim.opt.path:append { '**' }

-- vim.lsp.set_log_level("off")

-- vim.g.syntax_on = nil
-- vim.cmd("syntax off")

-- vim.g.cpp_attributes_highlight = 1
-- vim.g.cpp_member_highlight = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Supress intro message
vim.opt.shortmess:append('I')

-- Use 'cmp's completion float instead of native one
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.ignorecase = true

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_alto = 1
vim.g.netrw_altv = 1
vim.g.netrw_browse_split = 4  -- act like "P" on <enter>
vim.g.netrw_sizestyle = "H"

-- `:h shell-powershell` modified
-- vim.cmd [[
-- 	let &shell = 'pwsh'
-- 	let &shellcmdflag = '-NoLogo -NoProfile -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';$PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;'
-- 	let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
-- 	let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
-- 	set shellquote= shellxquote=
-- ]]

-- Using py.exe will solve all virtualenv issues
-- just make sure to install pynvim on global python env
-- and build your venvs with `--system-site-packages`
vim.g.python3_host_prog = "C:\\WINDOWS\\py.exe"

vim.g.node_host_prog = "C:/Users/henri/AppData/Roaming/npm/node_modules/neovim/bin/cli.js"

-- Fixed column for lsp signs
-- vim.wo.signcolumn = "yes"

vim.g.did_install_default_menus = 1

vim.g.firenvim_config = {
	globalSettings = { alt = "all" },
	localSettings = {
		[".*"] = {
			cmdline  = "neovim",
			content  = "text",
			priority = 0,
			selector = "textarea",
			takeover = "never"
		}
	}
}

-- Same statusline over windows
if vim.g.started_by_firenvim then
	vim.o.laststatus = 0
else
	vim.o.laststatus = 3
end

local light_state_path = vim.fn.stdpath('data') .. '/theme_state'
local fd = io.open(light_state_path, 'r')

if not fd then return end

local is_light = fd:read('*a') == 'light'
if is_light then
	vim.opt.bg = 'light'
end
