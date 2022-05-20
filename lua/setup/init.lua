local keymaps = require("setup.keymaps")


-- Constants and Variables
local NEOVIDE = vim.g.neovide
local DEFAULT_COLORSCHEME = 'pablo'

-- setup colorscheme and other theming stuff
local function colorscheme(config)
    local theme = config.theme
    local cs = theme.colorscheme or DEFAULT_COLORSCHEME
    if NEOVIDE and theme.neovide ~= nil then
        cs = theme.neovide
    end
    if type(theme.config) == 'function' then
        theme.config(cs)
    end
    vim.cmd('colorscheme ' .. cs)
end

local function commands(config)
    local cmds = config.commands
    for k, v in pairs(cmds) do
        vim.api.nvim_create_user_command(k, v, {})
    end
end

local function setup_all(config)
    colorscheme(config)
    commands(config)
    keymaps.setup_keymaps(config.keymaps)
end


return {
    setup = setup_all
}


