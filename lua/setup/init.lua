
-- Constants and Variables
local NEOVIDE = vim.g.neovide
local DEFAULT_COLORSCHEME = 'pablo'

-- setup colorscheme and other theming stuff
local function colorscheme(config)
    local theme = config.theme
    local cs = theme.colorscheme or DEFAULT_COLORSCHEME
    if NEOVIDE and theme.neovide ~= nil then
        cs = theme.neovide
    end
    if type(theme.config) == 'function' then
        theme.config(cs)
    end
    vim.cmd('colorscheme ' .. cs)
end

-- setup keymappings
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

    -- comment/uncomment
    if NEOVIDE then
        qm.vmap("<C-/>", ":CommentToggle<CR>")
        qm.nmap("<C-/>", "CommentToggle", {type = 'command'})
    else
        qm.vmap("<C-_>", ":CommentToggle<CR>")
        qm.nmap("<C-_>", "CommentToggle", {type = 'command'})
    end

    -- Clipboard
    if NEOVIDE then
        vim.cmd [[ 
            nmap <c-c> "+y
            vmap <c-c> "+y
            nmap <c-v> "+p
            inoremap <c-v> <c-r>+
            cnoremap <c-v> <c-r>+
            inoremap <c-r> <c-v>
        ]]
    end
end

local function setup(config)
    colorscheme(config)
    keymappings(config)
end

return {
    setup = setup
}


