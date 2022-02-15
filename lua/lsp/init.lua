local lsp_installer_servers = require('nvim-lsp-installer.servers')
local configs = require('lsp/configs').configs

for _, config in pairs(configs) do
    local server_available, server = lsp_installer_servers.get_server(config.name)
    if server_available then
        server:on_ready(function ()
            local opts = {}
            opts.root_dir = config.root_dir
            opts.config = config.config
            opts.settings = config.settings
            server:setup(opts)
        end)
    end
end

-- vim.lsp.handlers['textDocument/hover'] = function(_, method, result)
--   vim.lsp.util.focusable_float(method, function()
--     if not (result and result.contents) then
--       -- return { 'No information available' }
--       return
--     end
--     local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
--     markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
--     if vim.tbl_isempty(markdown_lines) then
--       -- return { 'No information available' }
--       return
--     end
--     local bufnr, winnr = vim.lsp.util.fancy_floating_markdown(markdown_lines, {
--       pad_left = 1; pad_right = 1;
--     })
--     vim.lsp.util.close_preview_autocmd({"CursorMoved", "BufHidden"}, winnr)
--     return bufnr, winnr
--   end)
-- end

