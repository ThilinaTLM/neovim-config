
-- EFM Configurations

local function lsp_configuration()
    return {
        init_options = {documentFormatting = true},
        settings = {
            rootMarkers = {".git/"},
            languages = {
                lua = {
                    {formatCommand = "lua-format -i", formatStdin = true}
                }
            }
        },
        filetypes = {"javascript", "javascriptreact", "typescript", "json"}
    }
end

return {
    server = 'efm',
    config = lsp_configuration
}
