
local function lsp_configuration(capabilities)
  return {
    capabilities = capabilities,
  }
end

return {
    config = lsp_configuration
}

