
local function root_dir_matcher(fname)
    local util = require('lspconfig').util
    local root_files = {
        'compile_commands.json',
        'compile_flags.txt',
        '.git',
    }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
end


local function lsp_configuration()
    return {
        cmd = { "clangd", "--background-index" },
        root_dir = root_dir_matcher
    }
end

local M = {}
M.config = lsp_configuration
M.server = 'clangd'

return M
