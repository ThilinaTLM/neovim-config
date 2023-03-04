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
local ts_utils = require('plugins.telescope').utils()

require('setup').commands({
    AutoFormat = require('utils.format').toggle_auto_format,
    AutoTrim = require('utils.format').toggle_auto_trim,
    Format =  require('utils.format').format,
    Projects = ts_utils.projects,
    Diagnostic = ":Telescope diagnostics",
    DapUi = function() require('dapui').toggle() end,
    CB = function() require('dap').set_breakpoint(vim.fn.input('Condition: ')) end,
})

require('runner').setup({terminal = 'konsole'})

require('setup').keymaps(function (N, NL, V)
    return {
        leader = ' ',
        copy_paste = true,
        enhacement = true,
        custom = {
            N('<leader>h', ':nohl<CR>'),
            N('<C-s>', ':w<CR>'), -- save CTRL+s

            -- Buffers
            N('<C-Left>', require('plugins.cokeline').fn.prev),
            N('<C-Right>', require('plugins.cokeline').fn.next),
            NL('q', require('plugins.cokeline').fn.delete),

            -- Motions
            N(',w', require('plugins.hop').fn.jump_word_forward),
            N(',b', require('plugins.hop').fn.jump_word_backward),
            N(',f', require('plugins.hop').fn.find_char2),

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
            NL('ff', ts_utils.find_files),
            NL('fg', ts_utils.live_grep),
            NL('fr', ts_utils.registers),
            NL('t', ts_utils.telescope),
            N('<C-e>', ':Neotree toggle<CR>'),

            -- Comment
            N('<C-/>', ':CommentToggle<CR>'),
            V('<C-/>', ':CommentToggle<CR>'),
            N('<C-_>', ':CommentToggle<CR>'),
            V('<C-_>', ':CommentToggle<CR>'),

            -- Terminal
            N('<C-`>', ':ToggleTerm size=60 direction=vertical<CR>'),

            -- Runner
            N('<F5>', require('runner').run_project),
        },
    }
end)


vim.cmd [[
    augroup kitty_mp
    autocmd!
    au VimLeave * :silent !kitty @ set-spacing padding=4 margin=0
    au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
    augroup END
]]

