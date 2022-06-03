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
-- Configurations
-- -----------------------------------------------------------------------------
pcall(require, 'impatient')
require('options')
require('plugins')

local ts = require('plugins.configs.telescope')
local keymaps = require('setup.keymaps')
local format = require('utils.format')
local N = keymaps.nnoremap
local NL = keymaps.nnoremap_leader
local V = keymaps.vnoremap

-- local luasnip_config = require("plugins/configs/lua-snip")
-- qm.nmap('<C-h>', luasnip_config.expand_or_jump)
-- qm.imap('<C-h>', luasnip_config.expand_or_jump)
-- qm.nmap('<C-l>', luasnip_config.back)
-- qm.imap('<C-l>', luasnip_config.back)

local settings = {
    theme = {
        pre = function ()
            vim.g.material_style = "darker"
        end,
        post = function ()
            vim.cmd ":highlight NormalFloat guibg='Black' guifg=NONE<CR>"
        end,
        colorscheme = 'material',
    },
    commands = {
        AutoFormat = format.toggle_auto_format,
        AutoTrim = format.toggle_auto_trim,
        Format =  format.format,
        Projects = require('plugins.configs.telescope').projects,
        DapUi = function() require('dapui').toggle() end,
        Diagnostic = ":Telescope diagnostics",
    },
    keymaps = {
        leader = ' ',
        copy_paste = true,
        enhacement = true,
        custom = {
            N('<leader>h', ':nohl<CR>'),
            N('<C-s>', ':w<CR>'), -- save CTRL+s

            -- buffers
            N('<C-Left>', '<Plug>(cokeline-focus-prev)'),
            N('<C-Right>', '<Plug>(cokeline-focus-next)'),
            NL('q', ':bd<CR>'), -- close buffer

            -- LSP related
            N('gd', vim.lsp.buf.definition),
            N('gi', vim.lsp.buf.implementation),
            N('gr', vim.lsp.buf.references),
            N('ca', vim.lsp.buf.code_action),
            NL('r', vim.lsp.buf.rename),
            N('<C-h>', vim.lsp.buf.hover),

            -- Debugging
            N('<F6>', require('dap').continue),
            N('<F7>', require('dap').terminate),
            N('<F8>', require('dap').restart),
            N('<F10>', require('dap').step_over),
            N('<F11>', require('dap').step_into),
            N('<F12>', require('dap').step_out),
            N('<C-b>', require('dap').toggle_breakpoint),
            NL('dw', require("plugins.configs.nvim-dap-ui").open_float),
            NL('de', require("plugins.configs.nvim-dap-ui").open_scope),
            NL('dd', ":Telescope dap commands<CR>"),

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

