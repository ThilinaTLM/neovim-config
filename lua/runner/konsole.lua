
local function is_available()
    return os.execute("which konsole") == 0
end

local function exec_in_new_win_with_shell(cmd)
    if is_available() then
        -- with shell
        cmd = 'konsole -e "sh -c \'' .. cmd .. '; read\'"'
        vim.fn.system(cmd)
    else
        print("konsole is not available")
    end
end

local function exec_in_new_win(cmd)
    if is_available() then
        -- without shell
        cmd = 'konsole -e "' .. cmd .. '"'
        vim.fn.system(cmd)
    else
        print("konsole is not available")
    end
end

return {
    is_available = is_available,
    exec_in_new_win_with_shell = exec_in_new_win_with_shell,
    exec_in_new_win = exec_in_new_win
}



