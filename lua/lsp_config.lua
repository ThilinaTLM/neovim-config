-- Completions
require('lspkind').init({})

local saga = require 'lspsaga'
saga.init_lsp_saga()

local map = vim.api.nvim_set_keymap

require("compe").setup {
  enabled = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  allow_prefix_unmatch = false,
  documentation = true,
  source = {
    path = true,
    nvim_lsp = true,
    buffer = true,
    vsnip = true,
    nvim_lua = true
  }
}

vim.o.completeopt = "menuone,noselect"

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

-- Language Servers
require'lspconfig'.pyright.setup{
}

require'lspconfig'.tsserver.setup{
}

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
          codeActions = true 
        },
        format = {
          enable = true,
          defaultFormatter = {
              js = "prettier",
              ts = "prettier",
              html = "prettier"
          },
          scriptInitialIndent = false,
          styleInitialIndent = false
        },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = true,
          template = true
        }
      }
    }
  };
}

require'lspconfig'.clangd.setup{
}

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

require'lspconfig'.vimls.setup{
}

local system_name = "Linux"
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
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

