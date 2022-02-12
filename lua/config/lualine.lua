local lualine = require('lualine')
local ts = require('nvim-treesitter')

local ts_status_opts = {
    indicator_size = 300,
    type_patterns = {"class", "function", "method", "interface", "type_spec", "table", "if_statement", "for_statement", "for_in_statement"},
    separator = '->'
}

local function treesitter()
    local status = ts.statusline(ts_status_opts)
    return string.format('%s', status)
end

local config = {
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename', treesitter},
        lualine_x = {'diagnostics'},
        lualine_y = {'encoding', 'fileformat', 'filetype'},
        lualine_z = {'location', 'progress'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

lualine.setup(config)
