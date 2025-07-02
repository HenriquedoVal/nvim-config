local keymap_set = vim.keymap.set

local function normal_ins_line_below()
    local x, _ = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(
        vim.api.nvim_win_get_buf(0), x, x, true, {''}
    )
end
local function normal_ins_line()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local x, _ = unpack(cursor)
    x = x - 1
    vim.api.nvim_buf_set_lines(vim.api.nvim_win_get_buf(0), x, x, true, {''})
    vim.api.nvim_win_set_cursor(0, cursor)
end
keymap_set('n', '<leader>O', normal_ins_line_below, {desc = 'Insert new line below cursor position'})
keymap_set('n', '<leader>o', normal_ins_line,       {desc = 'Insert new line on cursor position'})


local function toggle_theme()
    local to_set = 'light'
    if vim.api.nvim_get_option_value('bg', { scope='global' }) == 'light' then to_set = 'dark' end
    vim.opt.bg = to_set

    local light_state_path = vim.fn.stdpath('data') .. '/theme_state'
    local fd = io.open(light_state_path, 'w'); assert(fd)
    fd:write(to_set)
end
keymap_set('n', '<leader>tt', toggle_theme, {desc = 'Toggle light/dark theme'})


local function toggle_numbers()
    local opt = {win = vim.api.nvim_get_current_win()}
    local number = vim.api.nvim_get_option_value('number', opt)
    local boolean = true
    if number then
        boolean = false
    end

    vim.api.nvim_set_option_value('number', boolean, opt)
    vim.api.nvim_set_option_value('relativenumber', boolean, opt)
end
keymap_set('n', '<leader>l', toggle_numbers, {desc = 'Toggles line numbers'})


local function goto_prev()
    vim.diagnostic.jump({count=-1, float=true})
end
local function goto_next()
    vim.diagnostic.jump({count=1, float=true})
end
local function toggle_diagnostics()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end
keymap_set('n', '[d', goto_prev, {desc = 'Go to previous diagnostic'})
keymap_set('n', ']d', goto_next, {desc = 'Go to next diagnostic'})
keymap_set('n', '<leader>h', toggle_diagnostics, {desc = "Toggles diagnostics"})
keymap_set('n', '<leader>df', vim.diagnostic.open_float, {desc = 'Open diagnostics float window'})
keymap_set('n', '<space>dl', vim.diagnostic.setloclist, {desc = 'Open diagnostic window'})

keymap_set('i', '<c-l>', "<c-x><c-l>", {desc = "Line completion"})
keymap_set('i', '<c-f>', "<c-x><c-f>", {desc = "File name completion"})
keymap_set('i', '<c-d>', "<c-x><c-d>", {desc = "Definition completion"})
keymap_set('i', '<c-o>', "<c-x><c-o>", {desc = "Omni completion"})
keymap_set('i', '<c-n>', "<c-x><c-n>", {desc = "Buffer completion"})

keymap_set('n', '<c-m>', "<cmd>make<cr>", {desc = "Run :make"})
keymap_set('n', '<leader>n', "<cmd>cn<cr>", {desc = "Go to next quickfix item `:cnext`"})
keymap_set('n', '<leader>p', "<cmd>cp<cr>", {desc = "Go to prev quickfix item `:cprev`"})

--- misc ---
keymap_set('n', 'gtt', "<C-]>", {desc = "Go to definition using tags"})
keymap_set('n', '<leader>e', "<cmd>Lex<cr>", {desc = "Open Netrw"})
keymap_set('n', '<esc>', '<cmd>noh<cr>', {desc = 'Disable current highlight'})
keymap_set({'n', 'v'}, 'Y', '"*y', {desc = 'Yank to system clipboard'})
keymap_set({'i', 'c'}, '', '<c-w>', {desc = 'ctrl-bs to delete prev word'})

keymap_set('n', '<tab>', '<cmd>bn<cr>', {desc = 'Next buffer'})
keymap_set('n', '<s-tab>', '<cmd>bp<cr>', {desc = 'Prev buffer'})
keymap_set('n', '<leader>#', '<cmd>b#<cr>', {desc = 'Alternate buffer'})
keymap_set('n', '<leader><tab>', '<cmd>tabnext<cr>', {desc = 'Next tab'})
keymap_set('n', '<leader><s-tab>', '<cmd>tabprev<cr>', {desc = 'Prev tab'})

vim.api.nvim_create_autocmd('LspAttach', { callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    keymap_set('n', 'K', vim.lsp.buf.hover, opts)
    keymap_set('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap_set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap_set('n', 'gtd', vim.lsp.buf.type_definition, opts)

    keymap_set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap_set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap_set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    keymap_set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

    -- keymap_set('n', 'gr', vim.lsp.buf.references, opts)             -- same as grepping but less reliable
    -- keymap_set('n', '<leader>rn', vim.lsp.buf.rename, opts)         -- useless
    -- keymap_set('n', 'gi', vim.lsp.buf.implementation, opts)         -- use default |'n' gri|
    -- keymap_set('n', '<leader>k', vim.lsp.buf.signature_help, opts)  -- use default |'i' <c-s>|
    -- keymap_set('n', '<leader>f', function()
    --     vim.lsp.buf.format { async = true }
    -- end, opts)
end})
