
local COMMAND_TYPE = "nvim_command_type"

local M = {}

M.new_cmd_func = function(func, opts)
    -- validations and default values
    if opts == nil then
        opts = {}
    end
    -- creating new object
    local obj = {}
    local meta = {
        __index = function(self, k)
            return getmetatable(self)[k]
        end,
        __call = function(self, ...)
            return func(self, ...)
        end,
        __type = COMMAND_TYPE,
    }
    meta = vim.list_extend(meta, opts)
    setmetatable(obj, meta)
    return obj
end

M.setup_commands = function (cmds)
    for k, v in pairs(cmds) do
        if type(v) == "function" then
            vim.api.nvim_create_user_command(k, v, {})
        end
        vim.api.nvim_create_user_command(k, v, {})
    end
end

return M
