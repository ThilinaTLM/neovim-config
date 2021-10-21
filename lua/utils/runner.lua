
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

local function tmux_is_session()
    return os.getenv('TMUX') ~= nil
end

local function tmux_get_number_of_panes()
    local handle = io.popen('tmux list-panes | wc -l')
    return tonumber(handle:read('*a'))
end

local function tmux_open_output_split()
    os.execute('tmux splitw -h -p 30 -d')
end

-- Custom floating terminal
local fterm = require("FTerm.terminal")
local runner_terminal = fterm:new():setup({
    cmd = "zsh",
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


--
-- █░░ ▄▀█ █▄░█ █▀▀   █▀ █▀█ █▀▀ █▀▀
-- █▄▄ █▀█ █░▀█ █▄█   ▄█ █▀▀ ██▄ █▄▄
--

local function python_run_cmd()
    return "python \"" .. current_filename() .. "\""
end

local function cpp_run_cmd()
    return "./build.sh && ./build.sh run"
end

local function go_run_cmd()
    return "go run ./main.go"
end

local function get_run_command()
    if current_filetype() == "python" then
        return python_run_cmd()
    elseif current_filetype() == "go" then
        return go_run_cmd()
    elseif current_filetype() == "cpp" then
        return cpp_run_cmd()
    else
        print("unsupoort filetype")
        return ""
    end
end

local function resolve_cmd_from_arg(arg)
    if is_empty(arg) then
        return get_run_command()
    else
        return arg
    end
end

local function run_in_floating_window(arg)
    local cmd = resolve_cmd_from_arg(arg)
    if cmd ~= "zsh" then
        cmd = cmd .. " ; zsh"
    end
    run_cmd_floating_terminal(cmd)
end

local function run_in_tmux_split(arg)
    if not tmux_is_session() then
       print("Not a tmux session")
       return
    end
    if tmux_get_number_of_panes() < 2 then
       tmux_open_output_split()
    end
    run_cmd_split_window(resolve_cmd_from_arg(arg))
end

local function run_in_prefered(arg)
    if tmux_is_session() then
        run_in_tmux_split(arg)
    else
        run_in_floating_window(arg)
    end
end

local reg = require('config/whichkey').register
vim.api.nvim_command("command! -nargs=* RRun lua require('utils/runner').run_in_prefered(<q-args>)")
vim.api.nvim_command("command! -nargs=* RFloat lua require('utils/runner').run_in_floating_window(<q-args>)")
vim.api.nvim_command("command! -nargs=* RSplit lua require('utils/runner').run_in_tmux_split(<q-args>)")
vim.api.nvim_command("command! -nargs=* RClear lua require('utils/runner').run('clear')")

reg({
    r = { "<cmd>RRun<CR>", "Run File" },
    c = { "<cmd>RClear<CR>", "Clear Term" },
}, {prefix="<leader>r", mode="n"})


return {
    run_in_prefered = run_in_prefered,
    run_in_tmux_split = run_in_tmux_split,
    run_in_floating_window = run_in_floating_window
}


