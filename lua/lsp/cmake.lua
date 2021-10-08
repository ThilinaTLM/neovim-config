
local function root_dir_matcher(fname)
    local util = require('lspconfig').util
    local root_files = {
        'CMakeLists.txt',
        'compile_commands.json',
        'build',
        'compile_flags.txt',
        '.git',
    }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
end


local function lsp_configuration()
    return {
        cmd = { "cmake-language-server" },
        root_dir = root_dir_matcher,
        init_options = {
            buildDirectory = "build"
        }
    }
end

local M = {}
M.config = lsp_configuration
M.server = 'cmake'

return M
