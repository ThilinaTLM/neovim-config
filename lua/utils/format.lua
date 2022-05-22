local M = {}

M.lsp_format = function ()
    vim.lsp.buf.formatting()
end

M.treesitter_format = function ()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("normal gg=G")
    vim.api.nvim_win_set_cursor(0, pos)
end

M.remove_post_whitespaces = function ()
    pcall(vim.cmd, "%s/\\s\\+$//g")
end

M.format = function ()
    local ft = vim.bo.filetype
    if ft == "lua" then
        M.treesitter_format()
    else
        M.lsp_format()
    end
end

local auto_format_status = false
local auto_format_group = vim.api.nvim_create_augroup("auto_format", {clear = true})
local auto_format_id = 0

M.toggle_auto_format = function ()
    if auto_format_status == false then
        auto_format_id = vim.api.nvim_create_autocmd('BufWritePre',  {
            callback = function ()
                M.format()
                vim.cmd(":w")
            end,
            group = auto_format_group,
        })
        auto_format_status = true
        print("auto format on")
    else
        vim.api.nvim_del_autocmd(auto_format_id)
        auto_format_status = false
        print("auto format off")
    end
end

local auto_trim_status = false
local auto_trim_group = vim.api.nvim_create_augroup("auto_trim", {clear = true})
local auto_trim_id = 0

M.toggle_auto_trim = function ()
    if auto_trim_status == false then
        auto_trim_id = vim.api.nvim_create_autocmd('BufWritePre',  {
            callback = M.remove_post_whitespaces,
            group = auto_trim_group,
        })
        auto_trim_status = true
        print("auto remove post whitespaces on")
    else
        vim.api.nvim_del_autocmd(auto_trim_id)
        auto_trim_status = false
        print("auto remote post whitespaces off")
    end
end

return M


