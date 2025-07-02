--- Completion menu ---

local function set_color()
    vim.api.nvim_set_hl(0, 'ErrorMsg', { link = 'WarningMsg' })

    if vim.api.nvim_get_option_value('bg', { scope='global'}) == 'light' then
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#dddddd'})
    else
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#222222'})
    end
end

set_color()

vim.api.nvim_set_hl(0, 'PmenuKind', { link = 'Conditional'})
vim.api.nvim_set_hl(0, 'PmenuSel', { link = 'Include'})
vim.api.nvim_set_hl(0, 'PmenuKindSel', { link = 'Conditional'})
vim.api.nvim_set_hl(0, 'PmenuMatchSel', { link = 'Identifier'})

vim.api.nvim_create_autocmd('ColorScheme', { callback = set_color })


--- Folds ---
vim.api.nvim_set_hl(0, 'Folded', {})


--- Tabline ---

vim.opt.showtabline = 0
vim.api.nvim_create_autocmd({'BufAdd', 'BufDelete'}, { callback = function(ev)
    local bufqtt = 0

    -- because this event is fired BEFORE the buffer is actually deleted
    if ev.event == 'BufDelete' then
        bufqtt = bufqtt - 1
    end

    for _, v  in pairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_get_option_value('buflisted', { buf = v }) then
            bufqtt = bufqtt + 1
        end
        if bufqtt > 1 then
            vim.opt.showtabline = 2
            return
        end
    end

    vim.opt.showtabline = 0
end})

--- Light/Dark theme ---

-- lua\config\mappings.lua:20
local light_state_path = vim.fn.stdpath('data') .. '/theme_state'
local fd = io.open(light_state_path, 'r'); assert(fd)
local is_light = fd:read('*a') == 'light'
if is_light then
    vim.opt.bg = 'light'
end
