local wk = require('config/whichkey')
local km = require('keymaps/mapper')
local reg = wk.register;

-- map leader key to <space>
km.leader(' ')

-- Telescope Mappings
km.nmap('gd', '<cmd>Telescope lsp_definitions theme=cursor<CR>', 'Goto Definitions')
km.lnmap('ca', '<cmd>Telescope lsp_code_actions theme=cursor<CR>', 'Code Actions')
km.lnmap('ff', '<cmd>Telescope find_files theme=get_ivy<CR>', 'Find Files')
km.lnmap('fg', '<cmd>Telescope live_grep theme=get_ivy<CR>', 'Live Grep')
km.lnmap('fr', '<cmd>Telescope registers theme=dropdown<CR>', 'Clipboard')



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

    inoremap jk <ESC>
]]

return km;
