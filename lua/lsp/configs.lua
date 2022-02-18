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
    cmd = {lsp_path('go/gopls')},
    config = {},
    root_dir = root_dirs({
        'go.mod',
        '.git',
        'main.go',
        'test.go'
    }),

}

-- Typescript, Javascript -----------------------------------------------------------------------------------
lsp_configs.typescript = {
    name = 'tsserver',
    cmd = {'node', lsp_path('tsserver/node_modules/typescript-language-server/lib/cli.js'), '--stdio'},
    config = {},
    init_options = { hostInfo = "neovim" },
    root_dir = root_dirs({
        'package.json',
        'tsconfig.json',
        '.git',
        'main.ts',
        'main.js',
        'index.ts',
        'index.js',
    })
}

-- Angular --------------------------------------------------------------------------------------------------
lsp_configs.angular = {
    name = 'angularls',
    cmd = {lsp_path('angularls/node_modules/@angular/language-server/bin/ngserver'), '--stdio'},
    config = {},
    root_dir = root_dirs({
        'angular.json',
        'package.json',
        'tsconfig.json',
        '.git',
    })
}

-- C/C++ ----------------------------------------------------------------------------------------------------
lsp_configs.cpp = {
    name = 'clangd',
    cmd = {
        lsp_path('clangd/bin/clangd'),
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
    },
    config = {
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
    },
    root_dir = root_dirs({
        'compile_commands.json',
        'CMakeLists.txt',
        'main.cpp',
        'main.c',
        '.git',
    })
}

-- Rust ----------------------------------------------------------------------------------------------------
lsp_configs.rust = {
    name = 'rust_analyzer',
    config = {},
    root_dir = root_dirs({
        'Cargo.toml',
        'rust-project.json',
        'main.rs',
        '.git',
    })
}

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
return {
    configs = lsp_configs
}

