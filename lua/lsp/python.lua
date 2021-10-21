
-- Python Specific Configurations

local function root_dir_matcher(fname)
    local util = require('lspconfig').util
    local root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'main.py'
    }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
end


local function lsp_configuration()
    return {
        cmd = { "pylsp" },
        config = {
            configurationSources = { "flake8" },
            plugins = {
                pyls_mypy = {
                    enabled = true,
                    live_mode = true
                },
                flake8 = {
                    enabled = true,
                },
                pydocstyle = {
                    enabled = true
                }
            }
        },
        root_dir = root_dir_matcher
    }
end

local M = {}
M.config = lsp_configuration
M.server = 'pylsp'

return M
