local lualine = require('lualine')
local ts = require('nvim-treesitter')

local ts_status = {
    function()
        local ts_status_opts = {
            indicator_size = 300,
            type_patterns = {"class", "function", "method", "interface", "type_spec", "table", "if_statement", "for_statement", "for_in_statement"},
            separator = '->'
        }
        local status = ts.statusline(ts_status_opts)
        return string.format('%s', status)
    end
}

local lsp_status = {
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return msg end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' :',
    color = {fg = '#ffffff', gui = 'bold'}
}


local config = {
    options = {
        icons_enabled = true,
        theme = 'codedark',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename', ts_status},
        lualine_x = {lsp_status, 'diagnostics'},
        lualine_y = {'filetype'},
        lualine_z = {'location', 'progress'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'quickfix', 'nvim-tree'}
}

lualine.setup(config)
