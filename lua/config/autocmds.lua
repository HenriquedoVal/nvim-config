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


local load_cmp = function()
    require('config.after.cmp')
end

vim.api.nvim_create_user_command("Hexa", hexa_cmd, {})
vim.api.nvim_create_user_command("LoadCmp", load_cmp, {})

local wait = 1
vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'odin',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.odin')
				end,
				wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'ps1',
		callback = function(_ev)
            vim.defer_fn(function()
                require('config.triggers.pwsh')
                end,
                wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'lua',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.luaft')
				end,
				wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'python',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.python')
				end,
				wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = {'c', 'cpp'},
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.c')
				end,
				wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'cs',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.c_sharp')
				end,
				wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'javascript',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.js')
				end,
				wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'json',
		callback = function(_ev)
			vim.defer_fn(function()
				require('config.triggers.json')
				end,
				wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'css',
		callback = function(_ev)
			vim.defer_fn(function()
                require('config.triggers.css')
				end,
				wait
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{'FileType'},
	{
        once = true;
		pattern = 'html',
		callback = function(_ev)
			vim.defer_fn(function()
                require('config.triggers.html')
				end,
				wait
			)
		end
	}
)
