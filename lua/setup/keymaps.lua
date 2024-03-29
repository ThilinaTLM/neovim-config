
local NEOVIDE = vim.g.neovide

local function set_keymap(mode, lhs, rhs, opts)
    -- Prepare arguments.
    if opts == nil then
        opts = {}
    end
    if opts.noremap == nil then
        opts.noremap = true
    end
    if opts.silent == nil then
        opts.silent = true
    end
    if type(rhs) == 'function' then
        opts.callback = rhs
        rhs = ""
    end
    -- Set the keymap.
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local function copy_paste_keymaps()
    if NEOVIDE then
        vim.cmd [[ 
                vnoremap <C-c> "+y
                nnroemap <C-v> "+p
                inoremap <C-v> <C-r>+
                cnoremap <C-v> <C-r>+
                inoremap <C-r> <C-v>
            ]]
    else
        vim.api.nvim_set_keymap('n', '<C-c>', '"+yy', {noremap = true})
        vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true})
        vim.api.nvim_set_keymap('n', '<C-p>', '"+p', {noremap = true})
    end
end

local function enhancement_keymaps()
    vim.cmd [[
        nnoremap Y y$
        nnoremap n nzzzv
        nnoremap N Nzzzv
        nnoremap J mzJ`z

        inoremap , ,<c-g>u
        inoremap . .<c-g>u
        inoremap ! !<c-g>u
        inoremap ? ?<c-g>u

        nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
        nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

        vnoremap K :m '>+1<CR>gv=gv
        vnoremap J :m '<-2<CR>gv=gv
        nnoremap <leader>k :m .-2<CR>==
        nnoremap <leader>j :m .+1<CR>==

        inoremap jk <ESC>
    ]]
end

local M = {}


-- helper function to set a keymap
M.map = function (lhs, rhs)
    return { "", lhs, rhs }
end

-- helper function to set a keymap
M.nnoremap = function (lhs, rhs)
    return { "n", lhs, rhs }
end

-- helper function to set a keymap
M.vnoremap = function (lhs, rhs)
    return { "v", lhs, rhs }
end

-- helper function to set a keymap
M.inoremap = function (lhs, rhs)
    return { "i", lhs, rhs }
end

M.nnoremap_leader = function (lhs, rhs)
    lhs = '<leader>' .. lhs
    return { "n", lhs, rhs }
end

M.vnoremap_leader = function (lhs, rhs)
    lhs = '<leader>' .. lhs
    return { "v", lhs, rhs }
end

M.inoremap_leader = function (lhs, rhs)
    lhs = '<leader>' .. lhs
    return { "i", lhs, rhs }
end

M.setup = function(keymaps_config)
    local N = M.nnoremap
    local NL = M.nnoremap_leader
    local V = M.vnoremap

    if keymaps_config == nil then
        keymaps_config = {}
    elseif type(keymaps_config) == 'function' then
        keymaps_config = keymaps_config(N, NL, V)
    else
        keymaps_config = keymaps_config
    end

    -- map leader key
    vim.g.mapleader = keymaps_config.leader or ' '

    if keymaps_config.copy_paste then
        copy_paste_keymaps()
    end

    if keymaps_config.enhancement then
        enhancement_keymaps()
    end

    for _, keymap in ipairs(keymaps_config.custom) do
        set_keymap(unpack(keymap))
    end
end

return M

