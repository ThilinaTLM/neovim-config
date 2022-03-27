local gitsigns = require("gitsigns")

local config = {
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}

gitsigns.setup(config)
