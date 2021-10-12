local navigator = require('navigator')

local navigator_config = {
    debug = false, -- log output, set to true and log path: ~/.local/share/nvim/gh.log
    code_action_icon = " ",
    width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
    height = 0.3, -- max list window height, 0.3 by default
    preview_height = 0.35, -- max height of preview windows
    border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}, -- border style, can be one of 'none', 'single', 'double',
    default_mapping = true,  -- set to false if you will remap every key
    treesitter_analysis = true, -- treesitter variable context
    transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
    code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
    icons = {
        code_action_icon = " ",
        diagnostic_head = '🐛',
        diagnostic_head_severity_1 = "🈲",
    },
    lspinstall = false, -- set to true if you would like use the lsp installed by lspinstall
    lsp = {
        format_on_save = true, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
        disable_format_ft = {"sqls"},  -- a list of lsp not enable auto-format (e.g. if you using efm or vim-codeformat etc), empty by default
        diagnostic_scroll_bar_sign = {'▃', '█'}, -- experimental:  diagnostic status in scroll bar area; set to nil to disable the diagnostic sign,
        diagnostic_virtual_text = true,  -- show virtual for diagnostic message
        diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
        disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want to
        disable_lsp = {
            "angularls", "flow", "dockerls", "julials", "pyright",
            "jedi_language_server", "solargraph", "cssls",
            "yamlls", "sqls", "denols", "graphql", "dartls", "dotls",
            "kotlin_language_server", "nimls", "intelephense", "phpactor", "omnisharp",
            "r_language_server", "terraformls",
        },
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}

local lsp_configs = {
    require('lsp/python'),
    require('lsp/typescript'),
    require('lsp/rust'),
    require('lsp/clang'),
    require('lsp/go'),
}

require'lspconfig'.cmake.setup(require('lsp/cmake').config())

for i = 1, #lsp_configs do
    local lang_config = lsp_configs[i]
    local lsp_config = lang_config.config()
    lsp_config.capabilities = capabilities
    navigator_config.lsp[lang_config.server] = lsp_config
end

navigator.setup(navigator_config)

