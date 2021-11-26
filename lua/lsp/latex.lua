
-- Latex LSP support

local function root_dir_matcher(fname)
    local util = require('lspconfig').util
    local root_files = {
        '.git'
    }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
end


local function lsp_configuration()
    return {
        cmd = { "ltex-ls" },
        config = {
        },
        root_dir = root_dir_matcher
    }
end

return {
    config = lsp_configuration,
    server = 'ltex'
}

