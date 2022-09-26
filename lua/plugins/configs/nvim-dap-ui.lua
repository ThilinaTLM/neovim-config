local dapui = require("dapui")
local dap = require("dap")

dapui.setup({
    layouts = {
        {
            elements = {
                'scopes',
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40,
            position = 'left',
        },
        {
            elements = {
                'repl',
                'console',
            },
            size = 10,
            position = 'bottom',
        },
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
