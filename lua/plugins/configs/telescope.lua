local telescope = require("telescope")
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

telescope.load_extension('fzy_native')
telescope.load_extension('file_browser')
telescope.setup(config)

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

M.file_browser = function ()
    return telescope.extensions.file_browser.file_browser()
end

M.lsp = {
    definitions = function ()
        return builtins.lsp_definitions(themes.get_cursor({}))
    end,
    references = function ()
        return builtins.lsp_references(themes.get_cursor({}))
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

