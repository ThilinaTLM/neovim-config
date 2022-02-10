local lsp_installer_servers = require('nvim-lsp-installer.servers')
local configs = require('lsp/configs').configs

for _, config in pairs(configs) do
    local server_available, server = lsp_installer_servers.get_server(config.name)
    if server_available then
        server:on_ready(function ()
            local opts = {}
            opts.root_dir = config.root_dir
            opts.config = config.config
            print(string.format("%s: %s, cmd: %s", config.name, config.root_dir, server.cmd))
            server:setup(opts)
        end)
        -- if not server:is_installed() then
        --     server:install()
        -- end
    end
end

