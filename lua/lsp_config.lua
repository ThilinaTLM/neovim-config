-- LSP Saga
require('lspkind').init({})
local saga = require 'lspsaga'
saga.init_lsp_saga()

-- Neovim Compe
local map = vim.api.nvim_set_keymap
vim.o.completeopt = "menuone,noselect"
vim.cmd [[set shortmess+=c]]

require("compe").setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 1000,
  max_kind_width = 1000,
  max_menu_width = 1000000,
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    tabnine = false,
    path = true,
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    vsnip = true,
    treesitter = true,
  }
}

map("i", "<C-Space>", "compe#complete()", {silent = true, expr = true})
map(
  "i",
  "<CR>",
  "compe#confirm({ 'keys': '<Plug>delimitMateCR', 'mode': '' })",
  {silent = true, expr = true}
)
map("i", "<C-e>", "compe#close('<C-e>')", {silent = true, expr = true})
map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {silent = true, expr = true})
map("i", "<C-b>", "compe#scroll({ 'delta': -4 })", {silent = true, expr = true})

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}


-- Language Servers
-- EFM General Purpose
require "lspconfig".efm.setup {
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

-- Python
-- require'lspconfig'.pyright.setup{
--     on_attach = function()
--         require "lsp_signature".on_attach()
--     end
-- }
require'lspconfig'.pyls.setup{}

-- TypeScript JavaScript ReactJs
require'lspconfig'.tsserver.setup{
}

-- VueJs
require'lspconfig'.vuels.setup{
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

-- C/C++
require'lspconfig'.clangd.setup{
}

-- JSON
require'lspconfig'.jsonls.setup{
  commands = {
  Format = {
     function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
     end
    }
  };
  filetypes = {"json", "jsonc"}
}

-- Vimscript
require'lspconfig'.vimls.setup{
}

-- Lua
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
require'lspconfig'.sumneko_lua.setup {
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

-- CSS SCSS LESS
require'lspconfig'.cssls.setup {
    capabilities = capabilities,
}

-- HTML
require'lspconfig'.html.setup {
  capabilities = capabilities,
}


-- Diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		underline = true,
		virtual_text = true,
		signs = true,
		update_in_insert = false
	}
)

