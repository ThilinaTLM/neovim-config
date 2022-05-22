local get_hex = require('cokeline/utils').get_hex

local config = {
    default_hl = {
        fg = function(buffer)
            return
                buffer.is_focused
                and get_hex('Normal', 'bg')
                or get_hex('Comment', 'fg')
        end,
        bg = "#ff9800",
    },

    components = {
        {
            text = ' ',
        },
        {
            text = function(buffer) return buffer.devicon.icon .. ' ' end,
            fg = function(buffer) return buffer.devicon.color end,
        },
        {
            text = function(buffer) return buffer.index .. ': ' end,
        },
        {
            text = function(buffer) return buffer.unique_prefix end,
            fg = get_hex('Comment', 'fg'),
            style = 'italic',
        },
        {
            text = function(buffer) return buffer.filename .. ' ' end,
            style = function(buffer) return buffer.is_focused and 'bold' or nil end,
        },
        {
            text = ' ',
        },
    },

}

require('cokeline').setup(config)
