
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}


local lspconfig = require('lspconfig')

local configs = {
    require('lsp/python'),
    require('lsp/typescript'),
}

for i = 1, #configs do
    local lang_config = configs[i]
    local lsp_config = lang_config.config()
    lsp_config.capabilities = capabilities
    lspconfig[lang_config.server].setup(lsp_config)
end

