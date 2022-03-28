
local function colorscheme(config)
    if config.colorscheme == 'tokyonight' then
        vim.g.tokyonight_style = "night"
        vim.g.tokyonight_italic_functions = true
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "neo-tree" }
        vim.g.tokyonight_colors = {
            bg = "#282c34",
            bg_dark = "#181c24",
            bg_highlight = "#364A82",
            terminal_black = "#414868",
        }
        vim.cmd [[colorscheme tokyonight]]
    elseif config.colorscheme == 'duskfox' then
        vim.cmd [[colorscheme duskfox]]
    end
end

local function setup(config)
    colorscheme(config)
end

return {
    setup = setup
}


