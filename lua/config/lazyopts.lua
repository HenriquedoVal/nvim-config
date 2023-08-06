local opt = {
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
		"netrwPlugin",
		"tohtml",
		"tutor",
		"zipPlugin"
	}}}
}

return opt
