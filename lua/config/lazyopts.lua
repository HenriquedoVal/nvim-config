local M = {
	install = {
		colorscheme = { "gruvbox" }
	},
	ui = {
		border = "single"
	},
	performance = { rtp = { disabled_plugins = {
		-- "matchparen", -- faster
		-- "netrwPlugin",
        "editorconfig",
        "rplugin",
		"gzip",
		"matchit",
		"tarPlugin",
		"tohtml",
		"tutor",
		"zipPlugin",
        "man",
	}}},
    rocks = { enabled = false }
}

return M
