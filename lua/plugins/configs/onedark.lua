local onedark = require "onedark"

local config = {
    style = 'darker',
    transparent = true,
    term_colors = true,
    ending_tildes = true,
    toggle_style_key = ' cs',
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

    code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    colors = {
        bg = '#ffffff',
    }, -- Override default colors
    highlights = {
        -- LineNr = {bg = '#202020'},
        -- SignColumn = {bg = '#202020'},
    }, -- Override highlight groups

    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

onedark.setup(config)
