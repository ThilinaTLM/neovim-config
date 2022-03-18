vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local function install_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    local packer_bootstrap = false
    if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end
    return packer_bootstrap
end

local function load_plugins(sync)
    local packer = require("packer")
    local plugs = require("plugins/plugs")
    local config_dir = "plugins/configs"

    local plug_loader = function(use)
        local plug_lists = {
            plugs.primary,
            plugs.customization,
            plugs.language,
            plugs.enhancements,
            plugs.personal
        }
        for _, pl in ipairs(plug_lists) do
            for _, plug in ipairs(pl) do
                if type(plug) == "table" and type(plug.config) == "string" then
                    require(config_dir .. "/" .. plug.config)
                    plug.config = nil
                end
                use(plug)
            end
        end

        if sync then
            packer.sync()
        end
    end

    local packer_config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }

    packer.startup({plug_loader, config = packer_config})
end

local boostrap = install_packer()
load_plugins(boostrap)

