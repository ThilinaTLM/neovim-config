local telescope = require("telescope")

local config = {
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        file_browser = {
            theme = "ivy",
        },
    }
}

telescope.load_extension('fzy_native')
telescope.load_extension('file_browser')
telescope.setup(config)

