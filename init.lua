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
PR = function (v)
    print(vim.inspect(v))
    return v
end

UL = function (name)
    package.loaded[name] = nil
    return require(name)
end


-- -----------------------------------------------------------------------------
-- Configurations
-- -----------------------------------------------------------------------------
require('options')
require('plugins')
require('lsp')

local settings = {
    colorscheme = 'tokyodark',
    keymaps = {
        telescope = true
    }
}

require('setup').setup(settings)


-- -----------------------------------------------------------------------------
-- keymappings and other stuff
-- -----------------------------------------------------------------------------
local mp = require('nvim-mapper')
local qm = mp.qmap

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

vim.cmd [[
augroup kitty_mp
    autocmd!
    au VimLeave * :silent !kitty @ set-spacing padding=4 margin=0
    au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
augroup END
]]

-- Neo Tree
qm.nmap('<C-e>', "Neotree toggle", {type = 'command'})

-- Telescope Mappings
qm.nlmap('r', vim.lsp.buf.rename)
qm.imap('<C-L>', vim.lsp.buf.hover)
qm.nmap('<C-L>', vim.lsp.buf.hover)

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

-- Buufer and Window navigations
qm.nmap('<C-Left>', 'BufferLineCycleNext', {type = 'command'})
qm.nmap('<C-Right>', 'BufferLineCyclePrev', {type = 'command'})
qm.nlmap('bb', 'BufferLinePick', {type = 'command'})
qm.nlmap('q', 'bd', {type = 'command'})

vim.cmd [[
    set laststatus=3
]]
