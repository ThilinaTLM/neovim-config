local ulua = require('utils.lua')

local M = {}

M.reload_module = function (module_name)
    -- validations
    assert(type(module_name) == 'string', 'module_name must be a string')

    -- reload module
    package.loaded[module_name] = nil
    return require(module_name)
end
M.reload_module = ulua.new("nvim_command", M.reload_module, {nargs = 1})

return M
