local utils = require('runner/utils')

RUNNER_CONTEXT = {}

local function check_init()
    if RUNNER_CONTEXT.terminal == nil then
        print('RUNNER: Please run :lua require("runner").setup({terminal = "konsole"})')
        return false
    end
    return true
end

-- Setup
local function setup(config)
    local terminal = config.terminal or 'konsole'
    if terminal == 'konsole' then
        RUNNER_CONTEXT.terminal = require('runner/konsole')
    else
        print('RUNNER: Terminal not supported: ' .. terminal)
    end
end

-- Run project
local function run_project()
    if not check_init() then
        return
    end
    local file_type = utils.get_current_file_type()
    if file_type == 'rust' then
        local cmd = 'cargo run'
        RUNNER_CONTEXT.terminal.exec_in_new_win_with_shell(cmd)
    else
        print('No project found for filetype: ' .. file_type)
    end
end

return {
    setup = setup,
    run_project = run_project,
}

