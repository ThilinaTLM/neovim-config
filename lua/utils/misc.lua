
local function is_empty(str)
   return str == nil or str == ''
end

-- Get curret opened file name
local function current_filename()
    return vim.fn.expand("%:p")
end

-- Get current filetype
local function current_filetype()
    return vim.bo.filetype
end


return {
    is_empty = is_empty,
    current_filename = current_filename,
    current_filetype = current_filetype,
}
