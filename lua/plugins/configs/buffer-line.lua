require'bufferline'.setup{
    options = {
        diagnostics = "nvim_lsp",
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center" }},
        custom_filter = function(buf_number)
            if vim.fn.bufname(buf_number) ~= "output-window" then
                return true
            end
        end,
    }
}

