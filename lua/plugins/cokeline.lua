local function setup()
    local get_hex = require('cokeline/utils').get_hex
    local config = {
        default_hl = {
            fg = function(buffer)
                return buffer.is_focused and get_hex('Normal', 'bg') or get_hex('Comment', 'fg')
            end,
            bg = function (buffer)
                return buffer.is_focused and "#ff9800" or get_hex('Normal', 'bg')
            end
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
        sidebar = {
            filetype = 'neo-tree',
            components = {
                {
                    text = '  NeoTree  ',
                    fg = get_hex('Comment', 'fg'),
                    bg = get_hex('NeoTreeNormal', 'bg'),
                    style = 'bold',
                },
            }
        },
        buffers = {
            filter_valid = function(buffer)
                if buffer.filename == '[dap-repl]' then
                    return false
                end
                return true
            end,
        }
    }

    require('cokeline').setup(config)
end


local fn = {}

fn.next = function ()
    vim.api.nvim_exec('execute "normal \\<Plug>(cokeline-focus-next)"', false)
end

fn.prev = function ()
    vim.api.nvim_exec('execute "normal \\<Plug>(cokeline-focus-prev)"', false)
end

fn.delete = function ()
    local current_buffer = vim.api.nvim_get_current_buf()
    fn.next()
    vim.api.nvim_buf_delete(current_buffer, {})
end

return {
    'noib3/nvim-cokeline',
    config = setup,
    fn = fn,
}
