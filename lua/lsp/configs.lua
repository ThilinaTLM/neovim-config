-- LSP Configurations

-- root dir pattern generator
local function root_dirs(patterns)
    return function (fname)
        local util = require('lspconfig').util
        return util.root_pattern(unpack(patterns))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end
end

local M = {}

M.sumneko_lua = function(config)
    config = config or {}
    config.settings = {
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
        }
    }
    return config
end

M.pylsp = function(config)
    config = config or {}
    config.config = {
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
    }
    config.root_dir = root_dirs({
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'main.py'
    })
    return config
end

M.gopls = function (config)
    config = config or {}
    config.root_dir = root_dirs({
        'go.mod',
        '.git',
        'main.go',
        'test.go'
    })
    return config
end

M.clangd = function(config)
    config = config or {}
    config.cmd = config.cmd or {"clangd"}
    config.cmd = require("utils.lua").extend_arr(config.cmd, {
        "--background-index",
        "--compile-commands-dir=debug",
        "--all-scopes-completion",
        "--clang-tidy",
        "--completion-style=detailed",
        "--cross-file-rename",
        "--fallback-style='{BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 120}'",
        "--header-insertion=iwyu",
        "--header-insertion-decorators",
        "--hidden-features"
    })
    config.config = {
        single_file_support = true,
        clangd = {
            args = {
                '-log=verbose',
                '-background-index',
                '-index-file=clangd/data/index',
                '-targets=clangd/data/targets.json',
                '-compile-commands-dir=clangd/data/compile_commands',
                '-header-insertion=iwyu',
                '-clang-tidy',
                '-clang-tidy-checks=readability-braces-around-statements',
            }
        }
    }
    config.root_dir = root_dirs({
        'compile_commands.json',
        'CMakeLists.txt',
        'main.cpp',
        'main.c',
        '.git',
    })
    return config
end

M.rust_analyzer = function (config)
    config = config or {}
    config.root_dir = root_dirs({
        'Cargo.toml',
        'rust-project.json',
        'main.rs',
        '.git',
    })
    return config
end

return M

