local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = {
		"c", "cpp", "c_sharp",
		"python", "odin", "lua", "rust",
		"javascript", "html", "css"
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
