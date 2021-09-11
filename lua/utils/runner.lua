local fterm = require("FTerm.terminal")

-- Get curret opened file name
local function current_file_name()
    return vim.fn.expand("%:p")
end


local runner_terminal = fterm:new():setup({
    cmd = "python",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

local function run_python_shell()
    runner_terminal:setup({
        cmd = 'python'
    })
    print(current_file_name())
    runner_terminal:open()
end

local function run_current_python()
    runner_terminal:setup({
        cmd = 'python -i \'' .. current_file_name() .. '\''
    })
    print(current_file_name())
    runner_terminal:open()
end

local function run_current_rpal()
    runner_terminal:setup({
        cmd = 'rpal \'' .. current_file_name() .. '\'; zsh'
    })
    print(current_file_name())
    runner_terminal:open()
end


local function run_current_cargo()
    runner_terminal:setup({
        cmd = 'cargo run; zsh'
    })
    print(current_file_name())
    runner_terminal:open()
end

local function run_shell()
    runner_terminal:setup({
        cmd = 'zsh'
    })
    print(current_file_name())
    runner_terminal:open()
end

vim.api.nvim_command("command! RunShell lua require('utils/runner').run_shell()")
vim.api.nvim_command("command! RunPython lua require('utils/runner').run_python()")
vim.api.nvim_command("command! RunPyShell lua require('utils/runner').python_shell()")
vim.api.nvim_command("command! RunRPAL lua require('utils/runner').run_rpal()")
vim.api.nvim_command("command! RunCargo lua require('utils/runner').run_cargo()")


return {
    run_shell = run_shell,
    run_python = run_current_python,
    python_shell = run_python_shell,
    run_rpal = run_current_rpal,
    run_cargo = run_current_cargo
}
