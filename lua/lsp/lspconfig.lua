local lspconfig = require('lspconfig')

local function efm()
  lspconfig.efm.setup {
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

local function typescript()
  lspconfig.tsserver.setup()
end

local function vuejs()
  lspconfig.vuels.setup{
    filetypes = {"vue"};
    init_options = {
      config = {
        vetur = {
          completion = {
            autoImport = true,
            tagCasing = "kebab",
            useScaffoldSnippets = false
          },
          languageFeatures = {
            codeActions = true,
            semanticTokens = true,
            updateImportOnFileMove = true
          },
          format = {
            enable = true,
            defaultFormatter = {
              js = "prettier",
              ts = "prettier",
              html = "prettier",
              css = "prettier",
              scss = "prettier"
            },
            scriptInitialIndent = false,
            styleInitialIndent = false,
            options = {
              tabSize =  2
            }
          },
          useWorkspaceDependencies = false,
          validation = {
            interpolation = true,
            script = true,
            style = true,
            template = true,
            templateProps = true
          }
        }
      }
    };
  }
end

local function cpp()
  lspconfig.clangd.setup({})
end

local function lua()
  local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
  lspconfig.sumneko_lua.setup {
    cmd = {"lua-language-server", "-E", sumneko_root_path .. "/main.lua"};
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

local function python()
  lspconfig.pylsp.setup({
    config = {
      plugins = {
        pyls_mypy = {
          enabled = true,
          live_mode = false
        }
      }
    }
  })
end

local function json()
  lspconfig.jsonls.setup{
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    };
    filetypes = {"json", "jsonc"}
  }
end

local function css_scss(capabilities)
  lspconfig.cssls.setup {
    capabilities = capabilities,
  }
end

local function html(capabilities)
  lspconfig.html.setup {
    capabilities = capabilities,
  }
end

return {
  efm = efm,
  typescript = typescript,
  vuejs = vuejs,
  lua = lua,
  python = python,
  cpp = cpp,
  html = html,
  css_scss = css_scss,
  json = json
}


