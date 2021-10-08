
local wrp = require('utils/wrappers')

-- Search and Highliting
wrp.so("hlsearch", true)
wrp.so("ignorecase", true)
wrp.so("incsearch", true)
wrp.so("smartcase", true)

--- text rendering options
wrp.so("encoding", "utf-8")
wrp.so("linebreak", true)
wrp.so("scrolloff", 3)
wrp.so("sidescrolloff", 5)
wrp.so("wrap", false)
wrp.so("guifont", "Jet Brains:h9")
wrp.so("ruler", true)

-- indentation
wrp.so("tabstop", 4)
wrp.so("softtabstop", -1)
wrp.so("shiftwidth", 4)
wrp.so("shiftround", true)
wrp.so("expandtab", true)
wrp.so("autoindent", true)
wrp.so_con("cpoptions", 'I')
wrp.so("smartindent", true)
wrp.so("cindent", true)

--- code folding options
wrp.so("splitbelow", true)
wrp.so("splitright", true)
wrp.so("foldmethod", "expr")
wrp.so("foldexpr", "nvim_treesitter#foldexpr()")
wrp.so("foldlevel", 5)

--- miscellaneous options
wrp.so("autoread", true)
wrp.so("backspace", "indent,eol,start")
wrp.so("confirm", true)
wrp.so("dir", "/home/tlm/.cache/vim")
wrp.so_con("formatoptions", "j")
wrp.so("swapfile", false)
wrp.so_con("nrformats", ",alpha")
wrp.so("shell", "zsh")
wrp.so("path", ".,,**")
wrp.so("hidden", true)
wrp.so("mouse", "a")

--- interface options
wrp.so("number", true)
wrp.so("relativenumber", true)
wrp.so("cursorline", true)
wrp.so("termguicolors", true)

-- Other options
wrp.so("guifont", "JetBrainsMono Nerd Font Mono:h13")
-- vim.o.neovide_refresh_rate = '150'
-- vim.o.neovide_remember_window_size = true
-- vim.o.neovide_cursor_antialiasing = true
vim.cmd [[
    let g:neovide_cursor_antialiasing=v:true
    let neovide_remember_window_size = v:true
    let g:neovide_refresh_rate=150
]]
