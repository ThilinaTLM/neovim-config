
require'lspconfig'.pyright.setup{
  on_attach=require'completion'.on_attach;
}

require'lspconfig'.tsserver.setup{
  on_attach=require'completion'.on_attach;
}

require'lspconfig'.vuels.setup{
  on_attach=require'completion'.on_attach;
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
  on_attach=require'completion'.on_attach;
}

require'lspconfig'.jsonls.setup{
  on_attach=require'completion'.on_attach;
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
  on_attach=require'completion'.on_attach;
}

