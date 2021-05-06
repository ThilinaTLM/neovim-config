--- Utils
local function set_opt(option, value)
    if value == nil then
        value = true
    end
    vim.o[option]=value
end

local function ext_opt(option, value)
    vim.o[option]= vim.o[option] .. value
end

--- indentations options
vim.o.autoindent=true
vim.o.expandtab=true
vim.o.smarttab=true
vim.o.shiftwidth=4
vim.o.softtabstop=4

--- search options
vim.o.hlsearch=true
vim.o.ignorecase=true
vim.o.incsearch=true
vim.o.smartcase=true

--- text rendering options
vim.o.encoding="utf-8"
vim.o.linebreak=true
vim.o.scrolloff=3
vim.o.sidescrolloff=5
vim.o.wrap=false
vim.o.guifont="Hack:h9"
vim.o.ruler=true

--- code folding options
vim.o.foldmethod="indent"
vim.o.splitbelow=true
vim.o.splitright=true

--- miscellaneous options
vim.o.autoread=true
vim.o.backspace="indent,eol,start"
vim.o.confirm=true
vim.o.dir="/home/tlm/.cache/vim"
vim.o.formatoptions=vim.o.formatoptions .. "j"
vim.o.swapfile=false
vim.o.nrformats=vim.o.nrformats .. ",alpha"
vim.o.shell="zsh"
vim.o.path=".,,**"
vim.o.hidden=true
vim.o.mouse="a"

--- interface options
vim.wo.number=true
vim.wo.relativenumber=true

