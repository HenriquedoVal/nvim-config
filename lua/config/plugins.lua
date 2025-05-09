local M = {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},
	{
        dir = 'A:\\Dev\\github\\statusline.lua',
        dev = true
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
		'ii14/neorepl.nvim',
		cmd = 'Repl'
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
    -- {
    --     "stevearc/profile.nvim"
    -- },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    }
}

return M
