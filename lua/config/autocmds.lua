--- User commands ---

local prev_ft = nil
local hexa_state = false

local function hexa_cmd()
	if not hexa_state then
		hexa_state = true
		prev_ft = vim.opt.filetype:get()
		vim.api.nvim_command('%!xxd')
		vim.opt.ft = 'xxd'
		pcall(vim.api.nvim_command, 'LspStop')
	else
		hexa_state = false
		vim.api.nvim_command('%!xxd -r')
		vim.opt.ft = prev_ft
		pcall(vim.api.nvim_command, 'LspStart')
	end
end
vim.api.nvim_create_user_command("Hexa", hexa_cmd, {})


---@param t vim.api.keyset.create_user_command.command_args
local function align(t)
    if t.line1 == t.line2 then
        vim.notify(
            "This function acts on ranges only",
            vim.log.levels.ERROR,
            {}
        )
        return
    end

    local arg = t.args
    local lines = vim.api.nvim_buf_get_lines(0, t.line1 - 1, t.line2, true)
    local count = 0
    local max = -1
    for i = 1, #lines do
        local find = string.find(lines[i], arg, 1, true)
        if find ~= nil then
            if find > max then
                max = find
            end
            count = count + 1
        end
    end

    if count <= 1 then
        vim.notify(
            string.format("Not enough `%s` found", arg),
            vim.log.levels.WARN,
            {}
        )
        return
    end

    for i = 1, #lines do
        local find = string.find(lines[i], arg, 1, true)
        if find ~= nil and find ~= max then
            local linenr = t.line1 - 1 + i
            local line = lines[i]
            local pre = string.sub(line, 1, find - 1)
            local pos = string.sub(line, find)
            line =  pre .. string.rep(' ', max - find) .. pos
            vim.api.nvim_buf_set_lines(0, linenr - 1, linenr, true, {line})
        end
    end
end

vim.api.nvim_create_user_command("Align", align,{
    desc = "Align visual lines by given arg",
    nargs = 1,
    range = true
})

local function fold()
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldnestmax = 1
    vim.wo.foldtext = ''
end
vim.api.nvim_create_user_command("Fold", fold, {})


local function scratch()
    vim.bo.buftype = 'nofile'
    vim.bo.bufhidden = 'hide'
    vim.bo.swapfile = false
    vim.api.nvim_buf_set_name(0, 'Scratch')
end
vim.api.nvim_create_user_command("Scratch", scratch, {})

-- Proto in case I wanna deal with it
-- local function man(arg)
--     print('man was called')
-- end
-- vim.api.nvim_create_user_command("Man", man, {nargs = 1})


--- Autocommands ---

vim.api.nvim_create_autocmd({"VimLeave"}, {
	callback = function()
        vim.opt.guicursor = "a:ver25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
    end
})

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
