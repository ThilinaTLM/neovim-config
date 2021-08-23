
local function lsp_configuration()
  return {
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

return {
    config = lsp_configuration,
    indentation = 2
}
