
local function tmux_is_session()
    return os.getenv('TMUX') ~= nil
end

local function tmux_get_number_of_panes()
    local handle = io.popen('tmux list-panes | wc -l')
    return tonumber(handle:read('*a'))
end

local function tmux_open_right_split()
    os.execute('tmux splitw -h -p 30 -d')
end

return {
    is_session = tmux_is_session,
    get_number_of_panes = tmux_get_number_of_panes,
    open_right_split = tmux_open_right_split,
}
