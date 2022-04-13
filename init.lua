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
require('impatient')
require('options')
require('plugins')
require('lsp')

local settings = {
    theme = {
        colorscheme = 'tokyonight',
        neovide = 'tokyonight',
        config = function ()
            vim.g.tokyonight_style = "storm"
            vim.g.tokyonight_italic_functions = true
            vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "neo-tree" }
        end,
    },
    keymaps = {
        telescope = true,
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
mp.def_command("Projects", require('plugins.configs.telescope').projects)

-- Buufer and Window navigations
qm.nmap('<C-Left>', 'BufferLineCycleNext', {type = 'command'})
qm.nmap('<C-Right>', 'BufferLineCyclePrev', {type = 'command'})
qm.nlmap('bb', 'BufferLinePick', {type = 'command'})
qm.nlmap('q', 'bd', {type = 'command'})

vim.cmd [[
    set laststatus=3
]]

vim.cmd [[set updatetime=700]]
vim.api.nvim_create_augroup('lsp-hold-highlight', {clear = true})
vim.api.nvim_create_autocmd('CursorHold', {
    callback = function ()
        vim.lsp.buf.document_highlight()
    end,
    group = 'lsp-hold-highlight',
})
vim.api.nvim_create_autocmd('CursorMoved', {
    callback = function ()
        vim.lsp.buf.clear_references()
    end,
    group = 'lsp-hold-highlight',
})

vim.lsp.handlers['textDocument/hover'] = function(_, method, result)
  vim.lsp.util.focusable_float(method, function()
    if not (result and result.contents) then
      -- return { 'No information available' }
      return
    end
    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      -- return { 'No information available' }
      return
    end
    local bufnr, winnr = vim.lsp.util.fancy_floating_markdown(markdown_lines, {
      pad_left = 1; pad_right = 1;
    })
    vim.lsp.util.close_preview_autocmd({"CursorMoved", "BufHidden"}, winnr)
    return bufnr, winnr
  end)
end


