local ts = require("telescope")
local themes = require("telescope.themes")
local builtins = require("telescope.builtin")

local config = {
    extensions = {
        fzy = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
            theme = "dropdown",
        },
    }
}

local extensions = { 'fzf', 'project', 'dap' }

for _, ext in ipairs(extensions) do
    local ok, _ = pcall(ts.load_extension, ext)
    if not ok then
        print("Telescope: failed to load extension '" .. ext .. "'")
    end
end

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

