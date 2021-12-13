vim.cmd [[
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
    let g:vimtex_view_general_options_latexmk = '--unique'
    " let maplocalleader = ","
    let g:tex_flavor = 'latex'
]]
