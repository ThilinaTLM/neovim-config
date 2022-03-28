
local M = {}

M.remove_post_spaces = function()
    vim.api.nvim_command("%s/\\s\\+$//")
end

return M

