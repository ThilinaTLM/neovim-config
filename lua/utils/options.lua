
-- function which set options
local function set_opt(name, value, options)
    if options == nil then
        vim.opt[name] = value
    elseif options.append == true then
        vim.opt[name] = vim.o[name] + value
    elseif options.concat == true then
        vim.opt[name] = vim.o[name] .. value
    end
end

-- function which extends option by concatanation
local function set_opt_concat(name, value)
    vim.opt[name] = vim.o[name] .. value
end

-- function which extends option by adding
local function set_opt_append(name, value)
    vim.opt[name] = vim.o[name] + value
end

local wrappers = {}
wrappers['so'] = set_opt
wrappers['so_con'] = set_opt_concat
wrappers['so_add'] = set_opt_append
return wrappers

