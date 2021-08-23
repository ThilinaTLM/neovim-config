
-- LSP Saga
-- require('lspkind').init({})
-- require('lspsaga').init_lsp_saga()
-- require('lsp/compe').setup()

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

-- Language Servers
-- local lsps = require('lsp/lspconfig')
local lspconfig = require('lspconfig')
local coq = require('coq')

lspconfig.tsserver.setup(coq.lsp_ensure_capabilities{})



-- lsps.efm()
-- lsps.lua()
-- lsps.python()
-- lsps.typescript()

-- Diagnostics
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
-- 	vim.lsp.diagnostic.on_publish_diagnostics,
-- 	{
-- 		underline = true,
-- 		virtual_text = true,
-- 		signs = true,
-- 		update_in_insert = false
-- 	}
-- )

