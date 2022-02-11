local lsp_installer_servers = require('nvim-lsp-installer.servers')
local configs = require('lsp/configs').configs
local km = require('keymaps')

for _, config in pairs(configs) do
    local server_available, server = lsp_installer_servers.get_server(config.name)
    if server_available then
        server:on_ready(function ()
            local opts = {}
            opts.root_dir = config.root_dir
            opts.config = config.config
            server:setup(opts)
        end)
    end
end


