-- set leader key
vim.g.mapleader = ' '

-- options and plugins
require('setup.options')
require('setup.plugins')

-- set theme
vim.g.material_style = "darker"
vim.cmd('colorscheme material')
vim.cmd(":highlight NormalFloat guibg='#111111' guifg=NONE<CR>")

-- keymaps
local ts = require('plugins.configs.telescope')
local keymaps = require('setup.keymaps')
local format = require('utils.format')

local N = keymaps.nnoremap
local NL = keymaps.nnoremap_leader
local V = keymaps.vnoremap

require('setup').commands({
    AutoFormat = format.toggle_auto_format,
    AutoTrim = format.toggle_auto_trim,
    Format =  format.format,
    Projects = require('plugins.configs.telescope').projects,
    Diagnostic = ":Telescope diagnostics",
    DapUi = function() require('dapui').toggle() end,
    CB = function() require('dap').set_breakpoint(vim.fn.input('Condition: ')) end,
})

require('setup').keymaps({
    leader = ' ',
    copy_paste = true,
    enhacement = true,
    custom = {
        N('<leader>h', ':nohl<CR>'),
        N('<C-s>', ':w<CR>'), -- save CTRL+s

        -- Buffers
        N('<C-Left>', require('utils.buffers').prev),
        N('<C-Right>', require('utils.buffers').next),
        NL('q', require('utils.buffers').delete),

        -- Motions
        N(',w', require('plugins.configs.hop').jump_word_forward),
        N(',b', require('plugins.configs.hop').jump_word_backward),
        N(',f', require('plugins.configs.hop').find_char2),

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
        N('<C-/>', ':CommentToggle<CR>'),
        V('<C-/>', ':CommentToggle<CR>'),
        N('<C-_>', ':CommentToggle<CR>'),
        V('<C-_>', ':CommentToggle<CR>'),
    },
})

vim.cmd [[
    augroup kitty_mp
    autocmd!
    au VimLeave * :silent !kitty @ set-spacing padding=4 margin=0
    au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
    augroup END
]]

