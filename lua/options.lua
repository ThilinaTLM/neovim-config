
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


