local changecursor = function()
	vim.opt.guicursor = "a:ver25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
end

vim.api.nvim_create_autocmd({"VimLeave"}, {
	callback = changecursor
})

Prev_ft = nil
Hexa_state = false

local hexa_cmd = function()
	if not Hexa_state then
		Hexa_state = true
		Prev_ft = vim.opt.ft:get()
		vim.api.nvim_command('%!xxd')
		vim.opt.ft = 'xxd'
		pcall(vim.api.nvim_command, 'LspStop')
	else
		Hexa_state = false
		vim.api.nvim_command('%!xxd -r')
		vim.opt.ft = Prev_ft
		pcall(vim.api.nvim_command, 'LspStart')
	end
end

vim.api.nvim_create_user_command("Hexa", hexa_cmd, {})

local wait = 10
Odin_id = vim.api.nvim_create_autocmd(
	{'FileType'},
	{
		pattern = 'odin',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.odin').setup(Odin_id)  -- it will be defined by the time of the call
				end,
				wait
			)
		end
	}
)

Pwsh_id = vim.api.nvim_create_autocmd(
	{'FileType'},
	{
		pattern = 'ps1',
		callback = function(_ev)
            vim.defer_fn(function()
                require('config.triggers.pwsh').setup(Pwsh_id)
                end,
                wait
			)
		end
	}
)

Lua_id = vim.api.nvim_create_autocmd(
	{'FileType'},
	{
		pattern = 'lua',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.luaft').setup(Lua_id)
				end,
				wait
			)
		end
	}
)

Python_id = vim.api.nvim_create_autocmd(
	{'FileType'},
	{
		pattern = 'python',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.python').setup(Python_id)
				end,
				wait
			)
		end
	}
)

C_id = vim.api.nvim_create_autocmd(
	{'FileType'},
	{
		pattern = 'c',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.c').setup(C_id)
				end,
				wait
			)
		end
	}
)

Cs_id = vim.api.nvim_create_autocmd(
	{'FileType'},
	{
		pattern = 'cs',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.c_sharp').setup(Cs_id)
				end,
				wait
			)
		end
	}
)

Js_id = vim.api.nvim_create_autocmd(
	{'FileType'},
	{
		pattern = 'javascript',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.js').setup(Js_id)
				end,
				wait
			)
		end
	}
)
