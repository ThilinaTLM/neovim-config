
local server_name = 'rust_analyzer'


local function root_dir_matcher(fname)
    local util = require('lspconfig').util
    local root_files = {
        'Cargo.toml',
        'rust-project.json'
    }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
end


local function lsp_configuration()
    return {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_dir = root_dir_matcher,
        settins = {
            ["rust-analyzer"] = {}
        }
    }
end

return {
    config = lsp_configuration,
    server = server_name
}
