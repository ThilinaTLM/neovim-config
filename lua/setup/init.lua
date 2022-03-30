local function colorscheme(config)
    if config.colorscheme == 'tokyonight' then
        vim.g.tokyonight_style = "storm"
        vim.g.tokyonight_italic_functions = true
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "neo-tree" }
        vim.g.tokyonight_colors = {
            bg = "#282c34",
            bg_dark = "#181c24",
            bg_highlight = "#364A82",
            terminal_black = "#414868",
            bg_popup = "#181c24",
            bg_statusline = "#181c24",
        }
        vim.cmd [[colorscheme tokyonight]]
    elseif config.colorscheme == 'duskfox' then
        vim.cmd [[colorscheme duskfox]]
    elseif config.colorscheme == 'onedarkpro' then
        vim.cmd [[colorscheme onedarkpro]]
    elseif config.colorscheme == 'clean_colors' then
        vim.cmd [[colorscheme clean_colors]]
    end
end

local function keymappings(config)
    local mp = require('nvim-mapper')
    local qm = mp.qmap

    mp.set_leader(' ')

    if config.keymaps.telescope then
        local telescope = require('plugins.configs.telescope')

        qm.nmap('gd', telescope.lsp.definitions)
        qm.nmap('gi', telescope.lsp.implementations)
        qm.nmap('gr', telescope.lsp.references)
        qm.nlmap('ca', telescope.lsp.code_actions)

        qm.nlmap('ff', telescope.find_files)
        qm.nlmap('fg', telescope.live_grep)
        qm.nlmap('fr', telescope.registers)
        qm.nlmap('t', telescope.telescope)
        qm.nlmap('e', telescope.file_browser)
    end

end

local function setup(config)
    colorscheme(config)
    keymappings(config)
end

return {
    setup = setup
}


