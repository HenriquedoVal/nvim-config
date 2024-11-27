local M = {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},
	{
		'logan-connolly/statusline.lua',
        pin = true,
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
  --   {
  --       "nvim-tree/nvim-tree.lua",
  --       version = "*",
  --       -- lazy = false,
  --       dependencies = {
  --           "nvim-tree/nvim-web-devicons",
  --       },
  --       config = function()
  --           require("nvim-tree").setup {}
  --       end,
		-- keys = {
		-- 	{'<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTreeToggle'}
		-- }
  --   },
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
		opts = { },
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
	},
	{
		'glacambre/firenvim',
		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end
	},
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    }
}

return M
