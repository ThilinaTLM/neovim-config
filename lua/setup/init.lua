local function commands(cmds)
    for k, v in pairs(cmds) do
        vim.api.nvim_create_user_command(k, v, {})
    end
end

return {
    commands = commands,
    keymaps = require("setup.keymaps").setup,
}


