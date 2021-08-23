local function setup_compe()
    require("compe").setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 1000,
    max_kind_width = 1000,
    max_menu_width = 1000000,
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    };

    source = {
        nvim_lsp = true,
        path = true,
        buffer = true,
        nvim_lua = true,
        spell = true,
        vsnip = true,
        treesitter = true,
    }
    }
end

local function keymaps()
    local map = vim.api.nvim_set_keymap
    map("i", "<C-Space>", "compe#complete()", {silent = true, expr = true})
    map(
        "i",
        "<CR>",
        "compe#confirm({ 'keys': '<Plug>delimitMateCR', 'mode': '' })",
        {silent = true, expr = true}
    )
    map("i", "<C-e>", "compe#close('<C-e>')", {silent = true, expr = true})
    map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {silent = true, expr = true})
    map("i", "<C-b>", "compe#scroll({ 'delta': -4 })", {silent = true, expr = true})
end

local module = {}
module.setup = function()
    vim.o.completeopt = "menuone,noselect"
    vim.cmd [[set shortmess+=c]]
    setup_compe()
    keymaps()
end

return module

