local M = {}

M.remote_trailling_whitespaces = function()
    if not vim.o.binary and vim.o.filetype ~= 'diff' then
        local current_view = vim.fn.winsaveview()
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.fn.winrestview(current_view)
    end
end

return M
