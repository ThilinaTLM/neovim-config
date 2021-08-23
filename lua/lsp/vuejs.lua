
-- Vuejs Specific

local function lsp_configuration()
    return {
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

return {
    config = lsp_configuration
}
