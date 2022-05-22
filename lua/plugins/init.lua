local path_utils = require('utils.path')
local plugs = require("plugins/plugs")

local config_file_dir = "plugins/configs"

vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

local function install_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        return fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end
    return false
end


local function load_configuration(plug)
    if type(plug) == "table" and type(plug.config ) == "function" then
        plug.config()
        return true
    end

    local cf = ""
    if type(plug) == "table" and type(plug.config ) == "string" then
        cf = plug.config
    elseif type(plug) == "string" then
        cf = path_utils.get_basename(plug)
    else
        cf = path_utils.get_basename(plug[1])
    end

    local path_ext = path_utils.get_extension(cf)
    if path_ext ~= nil then
        cf = cf:sub(1, -1 * (#path_ext + 1))
    end

    if cf == "" then
        return false
    end

    cf = config_file_dir .. "/" .. cf

    local has_config, conf = pcall(require, cf)
    if has_config then
        if type(conf) == "table" and type(conf.setup) == "function" then
            conf.setup()
        end
        return true
    end
    return false
end

--load_configuration(plugs[32])

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
    load_configuration(plug)
end

packer.startup({function(use)
    for _, plug in ipairs(plugs) do
        if plug.dev and path_utils.is_exists(plug.dev .. "/lua") then
            plug[1] = plug.dev
            plug.dev = nil
        end
        plug.config = nil
        use(plug)
    end
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})


