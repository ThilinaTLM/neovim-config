local dapui = require("dapui")
local dap = require("dap")

dapui.setup({
    sidebar = {
        elements = {
            {
                id = "scopes",
                size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 00.25 },
        },
        size = 50,
        position = "right",
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local M = {}

local WIDTH = 150
local HEIGHT = 20

M.open_float = function()
  dapui.float_element(nil, {width = WIDTH, height = HEIGHT})
end

M.open_scope = function()
  dapui.float_element('scopes', {width = WIDTH, height = HEIGHT})
end

return M
