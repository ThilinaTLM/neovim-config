local META_TYPE_KEY = "__type"
local og_get_type = type

local M = {}

--- Extends a table with a another table.
---@param target table The table to extend.
---@vararg table The tables to extend the target table with.
---@return table The extended table.
M.extend = function(target, ...)
    for i = 1, select("#", ...) do
        local source = select(i, ...)
        for key, value in pairs(source) do
            target[key] = value
        end
    end
    return target
end

--- Create new lua object with given meta type.
-- if the provided object is function then wrapped object is callable
---@param meta_type string Meta type
---@param obj table Object to be wrapped (should be table or function)
---@param meta_data table Additional meta data
---@return table Wrapped object
M.new = function(meta_type, obj, --[[optional]]meta_data)
    -- validations
    local og_type = og_get_type(obj)
    assert(og_get_type(meta_type) == "string", "type must be a string")
    assert(og_type == "function" or og_type == "table", "object must be a table or function")
    assert(meta_data == nil or og_get_type(meta_data) == "table", "meta_data must be a table")

    -- create new object
    local mt = getmetatable(obj) or {}
    if meta_data ~= nil then
        mt = M.extend(mt, meta_data)
    end
    mt.__type = meta_type

    local wrapped = nil
    if og_type == "function" then -- wrap function
        mt.__call = function(_, ...)
            return obj(...)
        end
        mt.__index = function (self, k)
            return getmetatable(self)[k]
        end
        wrapped = {}
    else
        wrapped = obj
    end

    -- set metatable
    setmetatable(wrapped, mt)
    return wrapped
end

--- Get meta type of the object.
-- This is a wrapper function for original `type` function.
---@param obj table Object to get meta type (meta object)
---@return string Meta type
M.type = function (obj)
    local otype = og_get_type( obj )
    if otype ~= "table" then
        return otype
    end
    local mt = getmetatable( obj )
    if mt == nil then
        return otype
    end
    local t = mt[META_TYPE_KEY]
    if t == nil then
        return otype
    end
    return t
end

M.unload_package = function( package_name )
    if package.loaded[package_name] then
        package.loaded[package_name] = nil
    end
end

return M
