local ts = require("telescope")
local themes = require("telescope.themes")
local builtins = require("telescope.builtin")

local config = {
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        file_browser = {
            theme = "dropdown",
        },
    }
}

ts.load_extension('fzy_native')
ts.load_extension('project')

ts.setup(config)

local M = {}

M.find_files  = function ()
    return builtins.find_files(themes.get_dropdown({}))
end

M.live_grep  = function ()
    return builtins.live_grep(themes.get_dropdown({}))
end

M.registers = function ()
    return builtins.registers(themes.get_dropdown({}))
end

M.telescope = function ()
    return builtins.telescope(themes.get_dropdown({}))
end

M.projects = function ()
    return ts.extensions.project.project{display_type = "full"}
end

M.lsp = {
    definitions = function ()
        return builtins.lsp_definitions(themes.get_cursor({}))
    end,
    references = function ()
        return builtins.lsp_references(themes.get_cursor({width = 1000}))
    end,
    symbols = function ()
        return builtins.lsp_symbols(themes.get_cursor({}))
    end,
    code_actions = function ()
        return builtins.lsp_code_actions(themes.get_cursor({}))
    end,
    implementations = function ()
        return builtins.lsp_implementations(themes.get_cursor({}))
    end,
}
return M

