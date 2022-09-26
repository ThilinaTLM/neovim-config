local path_utils = require('utils.path')
local plugs = require("plugins/plugs")

local config_file_dir = "plugins/configs"

local function install_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        return fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end
    return false
end

local function get_fb_config_path(plugin_name)
    local cf = path_utils.get_basename(plugin_name)
    local path_ext = path_utils.get_extension(cf)

    if path_ext ~= nil then
        cf = cf:sub(1, -1 * (#path_ext + 1)) -- remove extension
    end

    if cf == "" then
        return nil
    end
    return config_file_dir.."/"..cf
end

local function configure_plugin_configs(plugin)

    assert(type(plugin) == "table", "plugin must be a table")
    assert(plugin.config == nil or type(plugin.config) ~= "function", "plugin.config must not be a function")

    local config_path = nil
    if type(plugin.conf) == "string" then
        config_path = config_file_dir .. "/" .. plugin.conf
    else
        config_path = get_fb_config_path(plugin[1])
    end
    if config_path == nil then
        return
    end

    local has_config, mod = pcall(require, config_path)
    if has_config then
        if type(mod) == "table" and mod.setup ~= nil then
            plugin.config = "require('" .. config_path .. "').setup()"
        else
            plugin.config = "require('" .. config_path .. "')"
        end
    else
        package.loaded[config_path] = nil
    end
end

local has_packer, packer = pcall(require, 'packer')
if not has_packer then
    if install_packer() then
        has_packer, packer = pcall(require, 'packer')
    else
        print("Packer not installed")
        return
    end
end

for _, plug in ipairs(plugs) do
    configure_plugin_configs(plug)
end

packer.startup({function(use)
    for _, plug in ipairs(plugs) do
        if plug.dev and path_utils.is_exists(plug.dev .. "/lua") then
            plug[1] = plug.dev
            plug.dev = nil
        end
        use(plug)
    end
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})


