
function unload_package(package_name)
    if package.loaded[package_name] then
        package.loaded[package_name] = nil
    end
end

function reload_package(package_name)
    unload_package(package_name)
    return require(package_name)
end

