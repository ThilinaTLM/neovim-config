
local M = {}

-- Switch to next buffer
M.next = function ()
    vim.cmd [[:bnext]]
end

M.prev = function ()
    vim.cmd [[:bprevious]]
end

M.delete = function ()
    vim.cmd [[:bd]]
end

return M


