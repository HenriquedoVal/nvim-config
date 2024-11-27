local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = {
		"c", "cpp", "c_sharp",
		"python", "odin", "lua", "rust", "java",
		"javascript", "html", "css",
        "json"
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = false },
})
