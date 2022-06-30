
local M = {}

M.next = function ()
    vim.api.nvim_exec('execute "normal \\<Plug>(cokeline-focus-next)"', false)
end

M.prev = function ()
    vim.api.nvim_exec('execute "normal \\<Plug>(cokeline-focus-prev)"', false)
end

M.delete = function ()
    local current_buffer = vim.api.nvim_get_current_buf()
    M.next()
    vim.api.nvim_buf_delete(current_buffer, {})
end

return M


