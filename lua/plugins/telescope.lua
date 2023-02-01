return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-project.nvim',
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make',
        'gbrlsnchs/telescope-lsp-handlers.nvim',
    },
    config = function()
        local ts = require('telescope')
        local extensions = { 'fzf', 'project', 'dap', 'lsp_handlers' }
        for _, ext in ipairs(extensions) do
            local ok, _ = pcall(ts.load_extension, ext)
            if not ok then
                print("Telescope: failed to load extension '" .. ext .. "'")
            end
        end
        ts.setup({
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
        })
    end,
}
