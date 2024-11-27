local M = {
	install = {
		colorscheme = { "gruvbox" }
	},
	ui = {
		border = "single"
	},
	performance = { rtp = { disabled_plugins = {
		"gzip",
		"matchit",
		"tarPlugin",
		-- "matchparen", -- faster
		-- "netrwPlugin",
		"tohtml",
		"tutor",
		"zipPlugin"
	}}}
}

return M
