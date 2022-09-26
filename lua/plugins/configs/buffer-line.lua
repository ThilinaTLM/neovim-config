
local options = {
    separator_style = 'slant',
    indicator_icon = '||',
    buffer_close_icon = '',
    show_close_icon = false,
    sort_by = 'insert_at_end',
    offsets = {{filetype = "neo-tree", text = "File Explorer", text_align = "center", highlight = 'Directory' }},

    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, _, _)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
    end,

    -- custom_filter = function(buf_number)
    --     if vim.fn.bufname(buf_number) ~= "neo-tree filesystem [1]" then
    --         return true
    --     end
    -- end,
}

options.custom_areas = {
      right = function()
    local result = {}
    local seve = vim.diagnostic.severity
    local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
    local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
    local info = #vim.diagnostic.get(0, {severity = seve.INFO})
    local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

    if error ~= 0 then
      table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
    end

    if warning ~= 0 then
      table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
    end

    if hint ~= 0 then
      table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
    end

    if info ~= 0 then
      table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
    end
    return result
          end,
}

local highlights = {
--     fill = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--     },
--     background = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     tab = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     tab_selected = {
--         guifg = "tabline_sel_bg",
--         guibg = '<color-value-here>'
--     },
--     tab_close = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     close_button = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     close_button_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     close_button_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     buffer_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     buffer_selected = {
--         guifg = "normal_fg",
--         guibg = '<color-value-here>',
--         gui = "bold,italic"
--     },
--     diagnostic = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--     },
--     diagnostic_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--     },
--     diagnostic_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic"
--     },
--     info = {
--         guifg = '<color-value-here>',
--         guisp = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     info_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     info_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic",
--         guisp = '<color-value-here>'
--     },
--     info_diagnostic = {
--         guifg = '<color-value-here>',
--         guisp = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     info_diagnostic_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     info_diagnostic_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic",
--         guisp = '<color-value-here>'
--     },
--     warning = {
--         guifg = '<color-value-here>',
--         guisp = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     warning_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     warning_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic",
--         guisp = '<color-value-here>'
--     },
--     warning_diagnostic = {
--         guifg = '<color-value-here>',
--         guisp = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     warning_diagnostic_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     warning_diagnostic_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic",
--         guisp = "warning_diagnostic_fg"
--     },
--     error = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         guisp = '<color-value-here>'
--     },
--     error_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     error_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic",
--         guisp = '<color-value-here>'
--     },
--     error_diagnostic = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         guisp = '<color-value-here>'
--     },
--     error_diagnostic_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     error_diagnostic_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic",
--         guisp = '<color-value-here>'
--     },
--     modified = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     modified_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     modified_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     duplicate_selected = {
--         guifg = '<color-value-here>',
--         gui = "italic",
--         guibg = '<color-value-here>'
--     },
--     duplicate_visible = {
--         guifg = '<color-value-here>',
--         gui = "italic",
--         guibg = '<color-value-here>'
--     },
--     duplicate = {
--         guifg = '<color-value-here>',
--         gui = "italic",
--         guibg = '<color-value-here>'
--     },
--     separator_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     separator_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     separator = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     indicator_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>'
--     },
--     pick_selected = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic"
--     },
--     pick_visible = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic"
--     },
--     pick = {
--         guifg = '<color-value-here>',
--         guibg = '<color-value-here>',
--         gui = "bold,italic"
--     }
}

require'bufferline'.setup{
    options = options,
    highlights = highlights,
}

