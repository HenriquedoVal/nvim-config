local M = {
	install = {
		colorscheme = { "gruvbox" }
	},
	ui = {
		border = "single"
	},
	performance = { rtp = { disabled_plugins = {
        "editorconfig",
		"gzip",
        "man",
		"matchit",
		-- "matchparen", -- faster
		-- "netrwPlugin",
        "osc52",
        "rplugin",
        -- "shada",
        -- "spellfile",
		"tarPlugin",
		"tohtml",
		"tutor",
		"zipPlugin",
	}}},
    rocks = { enabled = false }
}

return M
