
--
-- █░█ ▀█▀ █ █░░ █▀
-- █▄█ ░█░ █ █▄▄ ▄█
--

local function is_empty(str)
   return str == nil or str == ''
end

-- Get curret opened file name
local function current_filename()
    return vim.fn.expand("%:p")
end

-- Get current filetype
local function current_filetype()
    return vim.bo.filetype
end

-- Custom floating terminal
local fterm = require("FTerm.terminal")
local runner_terminal = fterm:new():setup({
    cmd = "python",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

-- Run command in floating terminal
local function run_cmd_floating_terminal(command)
    runner_terminal:setup({
        cmd = command
    })
    runner_terminal:open()
end

-- Run command in split window using tmux
local function run_cmd_split_window(command)
    vim.cmd("silent !tmux send-keys -t 1 '".. command .."' Enter")
end

-- Run command high-level function
-- mode=0 : (default) run command in split window
-- mode=1 : run command in floating window
local function run_cmd(command, mode)
    mode = mode or 0 -- default mode is 0
    if mode == 0 then
        run_cmd_split_window(command)
    else
        run_cmd_floating_terminal(command)
    end
end


--
-- █░░ ▄▀█ █▄░█ █▀▀   █▀ █▀█ █▀▀ █▀▀
-- █▄▄ █▀█ █░▀█ █▄█   ▄█ █▀▀ ██▄ █▄▄
--

local function get_python_cmd()
    return "python \"" .. current_filename() .. "\""
end

local function get_run_command()
    if current_filetype() == "python" then
        return get_python_cmd()
    end
end

local function is_tmux_session()
    if os.getenv('TMUX') then
        return true
    end
end

-- local function is_tmux_pane_exists()
-- return tonumber(string.match(result, '%d')) > 1
-- end

local function run(arg, mode)
    local cmd = is_empty(arg) and get_run_command() or arg
    run_cmd(cmd, mode)
end

local reg = require('config/whichkey').register
vim.api.nvim_command("command! -nargs=* RRun lua require('utils/runner').run(<q-args>)")
vim.api.nvim_command("command! -nargs=* RFloat lua require('utils/runner').run(<q-args>, 1)")
vim.api.nvim_command("command! -nargs=* RClear lua require('utils/runner').run('clear')")

reg({
    r = { "<cmd>Run<CR>", "Run File" },
    c = { "<cmd>RClear<CR>", "Clear Term" },
}, {prefix="<leader>r", mode="n"})


return {
    run = run
}


