
local lspconfig = require('lspconfig')
local coq = require('coq')

local configs = {
    require('lsp/python'),
    require('lsp/typescript'),
}

for i = 1, #configs do
    local config = configs[i]
    lspconfig[config.server].setup(coq.lsp_ensure_capabilities(config.config()))
end

vim.g.coq_settings = {
    auto_start = 'shut-up'
}
