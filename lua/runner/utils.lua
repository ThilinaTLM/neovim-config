
local function get_current_file_type()
    local file_type = vim.bo.filetype
    if file_type == '' then
        file_type = vim.fn.expand('%:e')
    end
    return file_type
end

return {
    get_current_file_type = get_current_file_type
}
