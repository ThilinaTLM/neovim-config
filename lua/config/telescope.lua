local telescope = require("telescope")
local km = require("keymaps")

local config = {
    defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  };
  extensions = {
    fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
  }
}

local keymaps = {
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files theme=get_ivy<CR>", "Find Files" },
        g = { "<cmd>Telescope live_grep theme=get_ivy<CR>", "Live Grep" },
    },
    p = { "<cmd>Telescope registers theme=dropdown<CR>", "Clipboard" },
}


km.lnreg(keymaps)
telescope.setup(config)
telescope.load_extension('fzy_native')

