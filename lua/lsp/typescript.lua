
-- Typescript/Javascript Specific

local function root_dir_matcher(fname)
    local util = require('lspconfig').util
    local root_files = {
        'package.json',
        'node_modules',
        'main.ts',
        'main.js',
        '.git'
    }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
end


local function lsp_configuration()
    return {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        init_options = {
            hostInfo = "neovim"
        },
        root_dir = root_dir_matcher
    }
end

return {
    server = 'tsserver',
    config = lsp_configuration
}
