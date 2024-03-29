
local function config()
    local lspkind = require("lspkind")
    local cmp = require("cmp")

    lspkind.init()

    cmp.setup({
        mapping = {
            ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.close(),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true, }),
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
        },
        sources = {
            { name = 'nvim_lua', priority = 40 },
            { name = 'nvim_lsp', priority = 80 },
            { name = 'path', priority = 90 },
            { name = 'luasnip', priority = 90 },
            { name = 'buffer', keyword_length = 10 },
            { name = 'cmp_tabnine', priority = 20 },
        },
        snippet = {
            expand = function (args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                menu = {
                    buffer = "⟦BUF⟧",
                    nvim_lsp = "⟦LSP⟧",
                    nvim_lua = "⟦NVIM⟧",
                    path = "⟦PATH⟧",
                    luasnip = "⟦SNIP⟧",
                    cmp_tabnine = "⟦TN⟧",
                }
            }),
        },
        experimental = {
            native_menu = false,
            ghost_text = false
        }
    })

    vim.cmd [[
    set completeopt=menu,menuone,noselect
]]

end

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'onsails/lspkind.nvim',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
    },
    config = config,
}
