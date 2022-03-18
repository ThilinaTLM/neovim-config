vim.cmd [[
  set packpath+=~/.config/nvim
  set packpath+=~/.config/nvim/after
  set packpath+=~/.local/share/nvim/site
  set runtimepath+=~/.config/nvim
  set runtimepath+=~/.config/nvim/after
]]

vim.cmd "filetype plugin on"
vim.cmd "syntax enable"

-- -----------------------------------------------------------------------------
-- Globals
-- -----------------------------------------------------------------------------
P = function (v)
    print(vim.inspect(v))
    return v
end

R = function (name)
    package.loaded[name] = nil
    return require(name)
end


-- -----------------------------------------------------------------------------
-- Configurations
-- -----------------------------------------------------------------------------
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

local mp = require('nvim-mapper')
local qm = mp.qmap

mp.set_leader(' ')

-- Usefull keybindings
vim.cmd [[nnoremap <C-s> :w<CR>]]
qm.nlmap('h', 'nohl', {type = 'command'})

qm.vmap('<C-C>', '"+y', {noremap = true})
qm.map('<C-p>', '"+p')

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


-- telescope utils
local tscmd = function(picker, theme, layout)
    if theme == nil then theme = '' else theme = string.format('theme=%s', theme) end
    if layout == nil then layout = '' else layout = string.format('layout_config=%s', layout) end
    return string.format('Telescope %s %s %s', picker, theme, layout)
end
local ts_theme = {
    dropdown = 'dropdown',
    cursor = 'cursor',
    ivy = 'ivy',
}
local ts_layout = {
    more_list = '{width=0.7,height=0.5,preview_width=0.5}'
}

-- Telescope Mappings
qm.nmap('gd', tscmd('lsp_definitions', ts_theme.cursor, ts_layout.more_list), {type = 'command'})
qm.nmap('gi', tscmd('lsp_implementation', ts_theme.cursor, ts_layout.more_list), {type = 'command'})
qm.nmap('gr', tscmd('lsp_references', ts_theme.cursor, ts_layout.more_list), {type = 'command'})
qm.nlmap('ca', tscmd('lsp_code_actions', ts_theme.cursor, ts_layout.more_list), {type = 'command'})
qm.nlmap('r', vim.lsp.buf.rename)
qm.imap('<C-L>', vim.lsp.buf.hover)
qm.nmap('<C-L>', vim.lsp.buf.hover)

qm.nlmap('ff', tscmd('find_files', ts_theme.ivy), {type = 'command'})
qm.nlmap('fg', tscmd('live_grep'), {type = 'command'})
qm.nlmap('fr', tscmd('registers'), {type = 'command'})
qm.nlmap('e', tscmd('file_browser', ts_theme.ivy), {type = 'command'})
qm.nlmap('t', 'Telescope', {type = 'command'})

qm.vmap("<C-_>", ":CommentToggle<CR>")
qm.nmap("<C-_>", "CommentToggle", {type = 'command'})

-- snippets
local luasnip_config = require("plugins/configs/lua-snip")
qm.nmap('<C-h>', luasnip_config.expand_or_jump)
qm.imap('<C-h>', luasnip_config.expand_or_jump)
qm.nmap('<C-l>', luasnip_config.back)
qm.imap('<C-l>', luasnip_config.back)

-- diagonostics
qm.nlmap('dn', vim.diagnostic.goto_next)
qm.nlmap('db', vim.diagnostic.goto_prev)

mp.def_command("Format", vim.lsp.buf.formatting)
mp.def_command("Run", ':ToggleTerm size=50 direction=vertical')

-- Copy & Paste

-- Buufer and Window navigations
qm.nmap('<C-Left>', 'BufferLineCycleNext', {type = 'command'})
qm.nmap('<C-Right>', 'BufferLineCyclePrev', {type = 'command'})
qm.nlmap('bb', 'BufferLinePick', {type = 'command'})
qm.nlmap('q', 'bd', {type = 'command'})

