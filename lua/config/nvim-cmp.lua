-- Setup nvim-cmp.
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
        -- ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
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
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'cmp_tabnine', priority = 41 },
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
        ghost_text = true
    }
})

vim.cmd [[
    set completeopt=menu,menuone,noselect
]]
return {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
