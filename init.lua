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
UL = function (name)
    package.loaded[name] = nil
    return require(name)
end

-- -----------------------------------------------------------------------------
-- Configurations
-- -----------------------------------------------------------------------------
pcall(require, 'impatient')
require('options')
require('plugins')
require('lsp')

local ts = require('plugins.configs.telescope')
local keymaps = require('setup.keymaps')
local format = require('setup.format')
local N = keymaps.nnoremap
local NL = keymaps.nnoremap_leader
local V = keymaps.vnoremap

-- local luasnip_config = require("plugins/configs/lua-snip")
-- qm.nmap('<C-h>', luasnip_config.expand_or_jump)
-- qm.imap('<C-h>', luasnip_config.expand_or_jump)
-- qm.nmap('<C-l>', luasnip_config.back)
-- qm.imap('<C-l>', luasnip_config.back)

vim.g.material_style = "darker"

local settings = {
    theme = {
        colorscheme = 'material',
        neovide = 'material',
    },
    commands = {
        AutoFormat = format.toggle_auto_format,
        AutoTrim = format.toggle_auto_trim,
        Format =  format.format,
        Projects = require('plugins.configs.telescope').projects,
    },
    keymaps = {
        leader = ' ',
        copy_paste = true,
        enhacement = true,
        custom = {
            N('<leader>h', ':nohl<CR>'),
            N('<C-s>', ':w<CR>'), -- save CTRL+s

            -- buffers
            N('<C-Left>', ':BufferLineCycleNext<CR>'),
            N('<C-Right>', ':BufferLineCyclePrev<CR>'),
            NL('q', ':bd<CR>'), -- close buffer

            -- LSP related
            N('gd', ts.lsp.definitions),
            N('gi', ts.lsp.implementations),
            N('gr', ts.lsp.references),
            N('ca', ts.lsp.code_actions),
            NL('r', vim.lsp.buf.rename),
            N('<C-l>', vim.lsp.buf.hover),

            -- diagonostics
            NL('dn', vim.diagnostic.goto_next),
            NL('db', vim.diagnostic.goto_prev),

            -- Project and files related
            NL('ff', ts.find_files),
            NL('fg', ts.live_grep),
            NL('fr', ts.registers),
            NL('t', ts.telescope),
            N('<C-e>', ':Neotree toggle<CR>'),

            -- Comment
            N('<C-_>', ':CommentToggle<CR>'),
            V('<C-_>', ':CommentToggle<CR>'),
        },
    },
}

require('setup').setup(settings)

vim.cmd [[
augroup kitty_mp
    autocmd!
    au VimLeave * :silent !kitty @ set-spacing padding=4 margin=0
    au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
augroup END
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

