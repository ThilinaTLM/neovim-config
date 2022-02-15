vim.cmd [[
    let g:copilot_no_tab_map = v:true 
    imap <silent><script><expr> <C-h> copilot#Accept("\<CR>")
]]
