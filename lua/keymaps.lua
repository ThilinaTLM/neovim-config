local wk = require('config/whichkey')

local reg = wk.register;

local keys = {
    leader = function(key) vim.g.mapleader = key end,
    map = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {noremap = true}) end,
    lmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", noremap=true}) end,
    nmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="n", noremap = true}) end,
    lnmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="n", noremap = true}) end,
    imap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="i", noremap = true}) end,
    limap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="i", noremap = true}) end,
    vmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="v", noremap = true}) end,
    lvmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="v", noremap = true}) end,
    reg = wk.register,
    nreg = function(mappings) wk.register(mappings, {mode="n", noremap = true}) end,
    ireg = function(mappings) wk.register(mappings, {mode="i"}) end,
    vreg = function(mappings) wk.register(mappings, {mode="v"}) end,
    lnreg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="n"}) end,
    lireg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="i"}) end,
    lvreg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="v"}) end,
}

-- map leader key to <space>
keys.leader(' ')

-- Copy & Paste
vim.cmd [[
    vnoremap <C-C> "+y
    map      <C-P> "+p
]]

-- Essentials
reg({
    e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },

    -- Buffer Manipulations
    b = {
        name = "Buffer",
        l = { "<cmd>BufferLineCycleNext<CR>", "Next" },
        h = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },
        b = { "<cmd>BufferLinePick<CR>", "Pick" },
        d = { "<cmd>bd<CR>", "Delete" }
    },
    q = { "<cmd>bd<CR>", "Delete" },

    w = { "<C-w>", "Window" },
    h = { "<cmd>nohl<CR>", "No Highlight" }
}, { prefix = "<leader>" })
reg({
    -- Buffers
    ['<C-Left>'] = { "<cmd>BufferLineCycleNext<CR>", "Next" },
    ['<C-Right>'] = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },

    -- Window
    ['<C-Up>'] = { "<cmd>vertical resize +1<CR>" },
    ['<C-Down>'] = { "<cmd>vertical resize -1<CR>" },

    -- Save
    ['<C-s>'] = { "<cmd>w<CR>", "Save" }

}, { prefix = "" })

-- Toggle Comment
reg({ ["<C-_>"] = { ":CommentToggle<CR>", "Comment" }, }, { prefix = "", mode = "v" })
reg({ ["<C-_>"] = { "<cmd>CommentToggle<CR>", "Comment" }, }, { prefix = "", mode = "n" })

-- Findings
reg({
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<CR>", "Find Files" },
        g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
    },
    p = { "<cmd>Telescope neoclip<CR>", "Clipboard" },
}, { prefix = "<leader>", mode='n' })


-- Usefull maps
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
]]

return keys;
