-- LSP Configurations

-- Generate absolute path to lsp servers
local lsp_dir = vim.fn.stdpath('data') .. '/lsp_servers'
local function lsp_path(relative_path)
  return vim.fn.expand(lsp_dir .. '/' .. relative_path)
end

-- root dir pattern generator
local function root_dirs(patterns)
    return function (fname)
        local util = require('lspconfig').util
        return util.root_pattern(unpack(patterns))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end
end

-------------------------------------------------------------------------------------------------------------
local lsp_configs = {}

-- Lua ------------------------------------------------------------------------------------------------------
lsp_configs.lua = {
        name = 'sumneko_lua',
        cmd = {lsp_path('sumneko_lua/extension/server/bin/lua-language-server')};
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    globals = {'vim'},
                },
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                },
                telemetry = {
                    enable = false,
                },
            },
        },
}

-- Python ---------------------------------------------------------------------------------------------------
lsp_configs.python = {
    name = 'pylsp',
    cmd = {lsp_path('pylsp/venv/bin/pylsp')};
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
    root_dir = root_dirs({
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'main.py'
    }),

}

-- Go lang --------------------------------------------------------------------------------------------------
lsp_configs.go = {
    name = 'gopls',
    cmd = {lsp_path('go/gopls')};
    config = {},
    root_dir = root_dirs({
        'go.mod',
        '.git',
        'main.go',
        'test.go'
    }),

}
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
return {
    configs = lsp_configs
}

