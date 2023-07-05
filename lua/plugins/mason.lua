local function config()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "pylsp", "clangd" },
        automatic_installation = false,
    })


    local configs = require('lsp/configs')

    require'lspconfig'.lua_ls.setup(configs.sumneko_lua())
    require'lspconfig'.pylsp.setup(configs.pylsp())
    require'lspconfig'.rust_analyzer.setup(configs.rust_analyzer())
    require'lspconfig'.clangd.setup(configs.clangd())
    require'lspconfig'.gopls.setup(configs.gopls())
    require'lspconfig'.jdtls.setup({})
    require'lspconfig'.slint_lsp.setup({})
end

return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim'
    },
    config = config,
}
