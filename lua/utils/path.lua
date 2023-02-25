
local mod_path = {}

mod_path.to_abs = function(path)
    if path:sub(1, 1) == "/" then
        return path
    elseif path:sub(1, 1) == "~" then
        return mod_path.to_abs(os.getenv("HOME")) .. "/" .. path:sub(2)
    elseif path:sub(1, 1) == "." then
        return mod_path.to_abs(os.getenv("PWD")) .. "/" .. path:sub(2)
    else
        return mod_path.to_abs(os.getenv("PWD")) .. "/" .. path
    end
end

mod_path.is_exists = function(path)
    path = mod_path.to_abs(path)
    return os.rename(path, path) ~= nil
end

mod_path.get_basename = function(path)
    return path:match("[^/]+$")
end

mod_path.get_extension = function(path)
    return path:match("[.][^.]+$")
end

return mod_path

