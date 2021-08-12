
-- Python
-- require'lspconfig'.pyright.setup{
--     on_attach = function()
--         require "lsp_signature".on_attach()
--     end
-- }

local M = {}

M.setup = function()
    require'lspconfig'.pylsp.setup{}
end

return M
