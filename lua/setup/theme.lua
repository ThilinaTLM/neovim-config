
local FALLBACK_COLORSCHEME = 'pablo'

local function setup_theme(theme)
    local cs = theme.colorscheme or FALLBACK_COLORSCHEME
    if type(theme.pre) == 'function' then
        theme.pre()
    end
    vim.cmd('colorscheme ' .. cs)
    if type(theme.post) == 'function' then
        theme.post()
    end
end

return {
    setup_theme = setup_theme
}
