local function config()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "sumneko_lua", "rust_analyzer", "pylsp", "clangd" },
        automatic_installation = false,
    })


    local configs = require('lsp/configs')

    require'lspconfig'.sumneko_lua.setup(configs.sumneko_lua())
    require'lspconfig'.pylsp.setup(configs.pylsp())
    require'lspconfig'.rust_analyzer.setup(configs.rust_analyzer())
    require'lspconfig'.clangd.setup(configs.clangd())
    require'lspconfig'.gopls.setup(configs.gopls())
end

return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim'
    },
    config = config,
}
