-- Search and Highliting
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true

--- Text rendering options
vim.o.linebreak = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.wrap = false
vim.o.ruler = true

-- Indentation
vim.o.tabstop = 4
vim.o.softtabstop = -1
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.cpoptions = vim.o.cpoptions .. 'I'
vim.o.smartindent = true
vim.o.cindent = true

--- Code folding options
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 5

--- Miscellaneous options
vim.o.autoread = true
vim.o.backspace = "indent,eol,start"
vim.o.confirm = true
vim.o.dir = "/home/tlm/.cache/vim"
vim.o.formatoptions = vim.o.formatoptions .. "j"
vim.o.swapfile = false
vim.o.nrformats = vim.o.nrformats .. ",alpha"
vim.o.shell = "zsh"
vim.o.path = ".,,**"
vim.o.hidden = true
vim.o.mouse = "a"

-- Persitency related things
vim.o.spellfile = '/home/tlm/.config/nvim/spell/en.utf-8.add'
vim.o.undodir = '/home/tlm/.config/nvim/undo'
vim.o.undofile = true

--- Interface options
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.list = true
vim.opt.listchars:append("trail:◆")
vim.opt.listchars:append("tab:▷ ")
vim.o.laststatus = 3

-- Characters
vim.opt.list = true
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("eol:↴")

