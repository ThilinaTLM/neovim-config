vim.cmd [[
  set packpath+=~/.config/nvim
  set packpath+=~/.config/nvim/after
  set packpath+=~/.local/share/nvim/site
  set runtimepath+=~/.config/nvim
  set runtimepath+=~/.config/nvim/after
]]

vim.cmd "filetype plugin on"
vim.cmd "syntax enable"

require('options')
require('plugins')
require('lsp')

-- set colorscheme
vim.cmd [[
  colorscheme gruvbox8_hard
]]

-- -----------------------------------------------------------------------------
-- keymappings and other stuff
-- -----------------------------------------------------------------------------

local mapper = require('keymapper')
local km = mapper.keymapper
local vcmd = mapper.vim_cmd
local tscmd = mapper.telescope_cmd
local reg = mapper.register

-- Set leader key
km.leader(' ')

-- constants
local ts_theme = {
    dropdown = 'dropdown',
    cursor = 'cursor',
    ivy = 'ivy',
}
local ts_layout = {
    more_list = '{width=0.7,height=0.5,preview_width=0.5}'
}

-- Telescope Mappings
km.nmap('gd', tscmd('lsp_definitions', ts_theme.cursor, ts_layout.more_list), 'Goto Definitions')
km.nmap('gi', tscmd('lsp_implementation', ts_theme.cursor, ts_layout.more_list), 'Goto Implementations')
km.nmap('gr', tscmd('lsp_references', ts_theme.cursor, ts_layout.more_list), 'Goto References')
km.lnmap('ca', tscmd('lsp_code_action', ts_theme.cursor, ts_layout.more_list), 'Code Actions')
km.lnmap('r', vcmd('lua vim.lsp.buf.rename()') , 'Rename Symbol')
km.lnmap('r', vcmd('lua vim.lsp.buf.rename()') , 'Rename Symbol')

km.lnmap('ff', tscmd('find_files', ts_theme.ivy), 'Find Files')
km.lnmap('fg', '<cmd>Telescope live_grep theme=get_ivy<CR>', 'Live Grep')
km.lnmap('fr', '<cmd>Telescope registers theme=dropdown<CR>', 'Clipboard')
km.lnmap('F', '<cmd>Telescope file_browser theme=get_ivy<CR>', 'File Browser')
km.lnmap('t', vcmd('Telescope'), 'Telescope')

km.vmap("<C-_>", ":CommentToggle<CR>", "Toggle comments")
km.nmap("<C-_>", "<cmd>CommentToggle<CR>", "Toggle comments")

vim.cmd[[ 
    command Format :lua vim.lsp.buf.formatting()<CR>
]]

-- Copy & Paste
vim.cmd [[
    vnoremap <C-C> "+y
    map      <C-P> "+p
]]

-- Essentials
reg({
    e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
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
    ['<C-Left>'] = { "<cmd>BufferLineCycleNext<CR>", "Next" },
    ['<C-Right>'] = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },
    ['<C-Up>'] = { "<cmd>vertical resize +1<CR>" },
    ['<C-Down>'] = { "<cmd>vertical resize -1<CR>" },
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

