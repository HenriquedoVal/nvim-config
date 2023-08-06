T = {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},
	{
		'beauwilliams/statusline.lua',
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = 'Telescope',
		keys = {
			{'<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope find_files'},
			{'<leader>lg', '<cmd>Telescope live_grep<cr>', desc = 'Telescope live_grep'},
			{'<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope buffers'},
			{'<leader>ht', '<cmd>Telescope help_tags<cr>', desc = 'Telescope help_tags'}
		}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = 'VeryLazy'
	},
	{
		'neovim/nvim-lspconfig',
		lazy = "VeryLazy"
	},
	{
		'hrsh7th/nvim-cmp',
		lazy = "VeryLazy",
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
		}
	},
	{
		'ii14/neorepl.nvim',
		cmd = 'Repl'
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{'<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Neotree toggle'}
		}
	},
	{
		"jiaoshijie/undotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require('undotree').setup({ window = { winblend = 0} })
		end,
		keys = {
			{'<leader>u', '<cmd>lua require("undotree").toggle()<cr>', desc = 'Undotree'}
		}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = { }
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
		keys = {
			{'gcc', 'gcc', desc = 'Toggle comment'},
			{'gc', 'gc', mode = 'v', desc = 'Toggle comment on Visual'},
		}
	},
	{
		"tversteeg/registers.nvim",
		name = "registers",
		config = function()
			local registers = require("registers")
			registers.setup({
				system_clipboard = false,
				window = {
					border = 'single',
					hightlight_cursorline = false,
					transparency = 0
				}
			})
		end,
		keys = {
			{ "\"",    mode = { "n", "v" } },
			{ "<C-R>", mode = "i" }
		},
		cmd = "Registers",
	},
	{
		"ray-x/lsp_signature.nvim",
		lazy = "VeryLazy"
	}
}

return T
