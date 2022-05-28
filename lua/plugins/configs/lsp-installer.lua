local lspconfig = require("lspconfig")
require("nvim-lsp-installer").setup({
    ensure_installed = {}
})

local configs = require("lsp.configs")

lspconfig.sumneko_lua.setup(configs.sumneko_lua())
lspconfig.rust_analyzer.setup(configs.rust_analyzer({cmd = {"rust-analyzer"}}))
lspconfig.gopls.setup(configs.gopls({ cmd = {"gopls"}}))
lspconfig.pylsp.setup()
lspconfig.clangd.setup(configs.clangd())
