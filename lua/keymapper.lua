local wk = require('config/whichkey')

local M = {}

KEY_MAPPER_RHS = {1}
M.map = function(mode, lhs, rhs, opts)
    -- default values and sanity checks
    if opts == nil then opts = {noremap = true, silent = true} end
    local prefix = opts.prefix or ''
    local rhs_type = opts.type
    if rhs_type == nil then
        if type(rhs) == 'function' then rhs_type = 'function' end
    end
    opts.type = nil
    opts.prefix = nil

    -- mappings
    if rhs_type == 'function' then
        -- if rsh is a function
        KEY_MAPPER_RHS[1] = KEY_MAPPER_RHS[1] + 1
        KEY_MAPPER_RHS[KEY_MAPPER_RHS[1]] = rhs
        vim.api.nvim_set_keymap(mode, prefix..lhs, string.format("<cmd>lua (KEY_MAPPER_RHS[%d])()<CR>", KEY_MAPPER_RHS[1]), opts)
    elseif rhs_type == 'command' then
        -- if rsh is a command
        vim.api.nvim_set_keymap(mode, prefix..lhs, string.format("<cmd>%s<CR>", rhs), opts)
    elseif rhs_type == 'lua' then
        -- if rsh is a lua expression
        vim.api.nvim_set_keymap(mode, prefix..lhs, string.format("<cmd>lua %s<CR>", rhs), opts)
    else
        -- if rsh is a string
        vim.api.nvim_set_keymap(mode, prefix..lhs, rhs, opts)
    end
end

M.new_mapper = function(mode, opts)
    return function(lhs, rhs, more_opts)
        local new_opts = {}
        if more_opts ~= nil then
            for k, v in pairs(more_opts) do
                new_opts[k] = v
            end
        end
        if opts ~= nil then
            for k, v in pairs(opts) do
                new_opts[k] = v
            end
        end
        M.map(mode, lhs, rhs, new_opts)
    end
end

M.qmap = {
    nmap = M.new_mapper('n'),
    vmap = M.new_mapper('v'),
    imap = M.new_mapper('i'),
    nlmap = M.new_mapper('n', {prefix = '<leader>'}),
    vlmap = M.new_mapper('v', {prefix = '<leader>'}),
    ilmap = M.new_mapper('i', {prefix = '<leader>'}),
}


M.vim_cmd = function(cmd)
    return string.format('<cmd>%s<CR>', cmd)
end

M.telescope_cmd = function(picker, theme, layout)
    if theme == nil then theme = '' else theme = string.format('theme=%s', theme) end
    if layout == nil then layout = '' else layout = string.format('layout_config=%s', layout) end
    return M.vim_cmd(string.format('Telescope %s %s %s', picker, theme, layout))
end

M.leader = function(key) vim.g.mapleader = key end

-- deprecated stuff
M.register = wk.register
-- M.km = {
--     reg = wk.register,
--     leader = function(key) vim.g.mapleader = key end,
--     nreg = function(mappings) wk.register(mappings, {mode="n", noremap = true}) end,
--     ireg = function(mappings) wk.register(mappings, {mode="i"}) end,
--     vreg = function(mappings) wk.register(mappings, {mode="v"}) end,
--     lnreg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="n"}) end,
--     lireg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="i"}) end,
--     lvreg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="v"}) end,
--     map = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {noremap = true}) end,
--     lmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", noremap=true}) end,
--     nmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="n", noremap = true}) end,
--     lnmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="n", noremap = true}) end,
--     imap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="i", noremap = true}) end,
--     limap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="i", noremap = true}) end,
--     vmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="v", noremap = true}) end,
--     lvmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="v", noremap = true}) end,
-- }

return M
