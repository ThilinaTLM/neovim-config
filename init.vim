
" ----------------------------------------
"           ┌─┐┌─┐┌┐┬┬─┤┬┌─┐              
"           │  │ ││││├─ ││ ┬              
"           └─┘└─┘┴└┘┴  ┴└─┘              
"        Builtin Configuration
" ----------------------------------------

set runtimepath^=~/.config/nvim 
set runtimepath+=~/.config/nvim/after
let &packpath=&runtimepath
let g:config_dir='/home/tlm/.config/nvim'
let g:script_dir=g:config_dir.'/scripts'
" -------- use vim config for neovim -------------------
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc
" ------------------------------------------------------

set nocompatible
filetype plugin on

" --- indentations options ---
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

" search options
set hlsearch
set ignorecase
set incsearch
set smartcase

" --- text rendering options ---
syntax enable
set encoding=utf-8
set linebreak
set scrolloff=3
set sidescrolloff=5
set nowrap
set guifont=Hack:h9

" interface options
set ruler
set number
set relativenumber

" code folding options
set foldmethod=syntax " syntax, indent
set splitbelow splitright

" miscellaneous options
set autoread
set backspace=indent,eol,start
set confirm
set dir=~/.cache/vim
set formatoptions+=j
set noswapfile
set nrformats+=alpha
set shell
set path=.,,**
set hidden
set mouse=a

" ---------------------------------------------------------
"                     ┬─┐┬  ┬ ┐┌─┐┌─┤
"                     │─┘│  │ ││ ┬└─┐
"                     ┴  └─┘└─┘└─┘├─┘
"                    The Plugin Manager
" ---------------------------------------------------------

" begin of vim plug list
call plug#begin('~/.config/nvim/plugged') " required
" ------------------------------------------------------------

    " --------------------- Appearence -----------------------
    " bottom status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " colorschema
    Plug 'morhetz/gruvbox'
    
    " HTML Colors
    Plug 'ap/vim-css-color'
    
    " ------------------- Intergrations -----------------------
    " FZF for Vim
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    
    " Git gutter
    Plug 'airblade/vim-gitgutter'
    
    " ------------------------ Tools ---------------------------
    " Floating Terminal
    Plug 'voldikss/vim-floaterm' 
    
    " Show live subsitution result
    Plug 'markonm/traces.vim'
    
    " Vim Wiki
    "Plug 'vimwiki/vimwiki'

    " surround words with quotes
    Plug 'tpope/vim-surround'

    " NvimTree Explorer
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    
    " ------------------ Autocompletion -------------------------
    " auto completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'gfanto/fzf-lsp.nvim'
    
    " ------------------- Language Specific ----------------------
    " Language Pack
    Plug 'sheerun/vim-polyglot'

" ------------------------------------------------------------
" end of vim plug list
call plug#end()

" --------------------------------------------------------------------------
"  Scripts
" --------------------------------------------------------------------------

execute "source ".g:script_dir."/auto-pair.vim"
execute "source ".g:script_dir."/buff-only.vim"

" ------------------------------------------------
"           ┬┌ ┬─┐┐ ┬┌┬┐┌─┐┬─┐┌─┤
"           ├┴┐├─ └┌┘││││─┤│─┘└─┐
"           ┴ ┘┴─┘ │ ┴ ┴┘ └┴  ├─┘
"             Personal Keymaps
" ------------------------------------------------

" Leader key
let mapleader = ','
inoremap jj <ESC>

" Clipboard
vnoremap <C-C> "+y
map      <C-P> "+p

" ---------------------------------------
" -- Buffer Manipulations
" ---------------------------------------

" Switch buffers
nnoremap <silent> <space>l :bn<CR>
nnoremap <silent> <space>h :bp<CR>
nnoremap <silent> <space>q :bd<CR>

" Save buffer
nnoremap <C-s> :w<CR>

" Autocompletion with TAB KEY 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ---------------------------------------
" -- Window Manipulations
" ---------------------------------------

" Window navigations
nnoremap <silent> <C-Up> :vertical resize +1<CR>
nnoremap <silent> <C-Down> :vertical resize -1<CR>
nnoremap <space>w <C-w>
nnoremap <silent> <C-w>1 :1wincmd w<CR>
nnoremap <silent> <C-w>2 :2wincmd w<CR>
nnoremap <silent> <C-w>3 :3wincmd w<CR>
nnoremap <silent> <C-w>4 :4wincmd w<CR>

" --------------------------------------------------------------------------
"                       ┌┬┐┌─┐┬─┐┬ ┐┬  ┬─┐┌─┤
"                       ││││ ││ ││ ││  ├─ └─┐
"                       ┴ ┴└─┘┴─┘└─┘└─┘┴─┘├─┘
"             Configuration for plugins and other modules
" --------------------------------------------------------------------------

" -----------------------------------
"  Naitive LSP and Autocompletion
" -----------------------------------


execute "luafile ".g:config_dir."/lsp.lua"

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

command Rename :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <space>r :lua vim.lsp.buf.rename()<CR>

command Format :lua vim.lsp.buf.formatting()<CR>

" Using FZF
nnoremap <silent> gd :Definitions<CR>
nnoremap <silent> gD :Declarations<CR>
nnoremap <silent> gr :References<CR>
nnoremap <silent> gi :Implementations<CR>
nnoremap <silent> gi :Implementations<CR>
nnoremap <silent> <leader>ca :CodeActions<CR>

" Autocompletion
highlight link CompeDocumentation NormalFloat
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" -----------------------------
"  Nvim Tree
" -----------------------------

let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 30 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.idea' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 1 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 1 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
highlight NvimTreeGitNew guibg=yellow

lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      -- default mappings
      ["<CR>"]           = tree_cb("edit"),
      ["<right>"]        = tree_cb("edit"),
      ["o"]              = tree_cb("edit"),
      ["<2-LeftMouse>"]  = tree_cb("edit"),
      ["<2-RightMouse>"] = tree_cb("cd"),
      ["<C-]>"]          = tree_cb("cd"),
      ["<C-v>"]          = tree_cb("vsplit"),
      ["<C-x>"]          = tree_cb("split"),
      ["<C-t>"]          = tree_cb("tabnew"),
      ["<"]              = tree_cb("prev_sibling"),
      [">"]              = tree_cb("next_sibling"),
      ["<BS>"]           = tree_cb("close_node"),
      ["<left>"]         = tree_cb("close_node"),
      ["<S-CR>"]         = tree_cb("close_node"),
      ["<Tab>"]          = tree_cb("preview"),
      ["I"]              = tree_cb("toggle_ignored"),
      ["H"]              = tree_cb("toggle_dotfiles"),
      ["R"]              = tree_cb("refresh"),
      ["a"]              = tree_cb("create"),
      ["d"]              = tree_cb("remove"),
      ["r"]              = tree_cb("rename"),
      ["<C-r>"]          = tree_cb("full_rename"),
      ["x"]              = tree_cb("cut"),
      ["c"]              = tree_cb("copy"),
      ["p"]              = tree_cb("paste"),
      ["[c"]             = tree_cb("prev_git_item"),
      ["]c"]             = tree_cb("next_git_item"),
      ["-"]              = tree_cb("dir_up"),
      ["q"]              = tree_cb("close"),
    }
EOF

nnoremap <space>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" -----------------------------
"  Airline Theme & ColorScheme
" -----------------------------

" ColorScheme
let g:gruvbox_italic=1
let g:gruvbox_termcolors=256
colorscheme gruvbox
set termguicolors
set background=dark

let g:airline_theme='base16_gruvbox_dark_pale'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" -----------------------------
"  Floaterm (Floating Terminal)
" -----------------------------

" Floating terminal
nnoremap <silent> tt :FloatermNew<CR>
nnoremap <silent> tw :FloatermKill<CR>
nnoremap <silent> ts :FloatermShow<CR>

" -----------------------------
"  FZF Vim
" -----------------------------


nnoremap <silent> <space>ff :Files<CR>
nnoremap <silent> <space>fg :GitFiles<CR>
nnoremap <silent> <space>fw :Windows<CR>
nnoremap <silent> <space>fb :Buffers<CR>
nnoremap <silent> <space>fm :Marks<CR>
nnoremap <silent> <space>fl :BLines<CR>
nnoremap <silent> <space>fL :Lines<CR>

