local keymaps = require("setup.keymaps")
local theme = require("setup.theme")

-- Setup the custom commands
local function commands(cmds)
    for k, v in pairs(cmds) do
        vim.api.nvim_create_user_command(k, v, {})
    end
end

local function setup_all(config)
    commands(config.commands)
    theme.setup_theme(config.theme)
    keymaps.setup_keymaps(config.keymaps)
end

return {
    setup = setup_all
}


