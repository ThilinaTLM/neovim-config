
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
set foldmethod=indent " syntax, indent
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
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    "Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    Plug 'akinsho/nvim-bufferline.lua'

    " colorschema
    Plug 'morhetz/gruvbox'
    
    " HTML Colors
    Plug 'ap/vim-css-color'
    
    " ------------------- Intergrations -----------------------
    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    
    " Git gutter
    Plug 'airblade/vim-gitgutter'
    
    " ------------------------ Tools ---------------------------
    " Floating Terminal
    Plug 'voldikss/vim-floaterm' 
    
    " Show live subsitution result
    Plug 'markonm/traces.vim'
    
    " surround words with quotes
    Plug 'tpope/vim-surround'

    " NvimTree Explorer
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'Raimondi/delimitMate'
    
    " ------------------ Autocompletion -------------------------
    " auto completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'onsails/lspkind-nvim'
    Plug 'hrsh7th/nvim-compe'
    
    " ------------------- Language Specific ----------------------
    " Language Pack
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" ------------------------------------------------------------
" end of vim plug list
call plug#end()


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

" -----------------------------
"  Nvim Tree
" -----------------------------

let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.idea' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_hijack_netrw = 1 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE', "package.json" ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

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

" -----------------------------------
"  Naitive LSP and Autocompletion
" -----------------------------------
lua require('lsp_config')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Aditional commands
command Format :lua vim.lsp.buf.formatting()<CR>

" -----------------------------------
"  LspSaga
" -----------------------------------
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent> <leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> <leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
nnoremap <silent> <leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent> <A-d> <C-d><C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

highlight link LspSagaFinderSelection Search

" -----------------------------
" Telescope
" -----------------------------

nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>

" Quick Use Commands
"
command Lists :lua require'telescope.builtin'.builtin{}
command Keymaps :lua require'telescope.builtin'.keymaps{}
command Spells :lua require'telescope.builtin'.spell_suggest{}
command Registers :lua require'telescope.builtin'.registers{}
command GBranch :lua require'telescope.builtin'.git_branches{}
command GStatus :lua require'telescope.builtin'.git_status{}

" LSP
command Definitions :lua require'telescope.builtin'.lsp_definitions{}
command SymbolsWorkspace :lua require'telescope.builtin'.lsp_workspace_symbols{}
command References :lua require'telescope.builtin'.lsp_references{}
command Actions :lua require'telescope.builtin'.lsp_code_actions{}
command Diagnostics :lua require'telescope.builtin'.lsp_document_diagnostics{}

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {"node_modules", ".git"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  };
  extensions = {
    fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
  }
}
require('telescope').load_extension('fzy_native')
EOF

" -----------------------------
"  Galaxyline
" -----------------------------
lua << EOF



EOF

" -----------------------------
"  Airline Theme & ColorScheme
" -----------------------------

" ColorScheme
set cursorline
set termguicolors
set background=dark
set t_Co=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" -----------------------------
"  Floaterm (Floating Terminal)
" -----------------------------

" Floating terminal
nnoremap <silent> tt :FloatermNew<CR>
nnoremap <silent> tw :FloatermKill<CR>
nnoremap <silent> ts :FloatermShow<CR>

" -----------------------------
"  GitGutter
" -----------------------------

let g:gitgutter_enabled = 1 " disable when start


" -----------------------------
"  Bufferline
" -----------------------------
lua require'bufferline'.setup{}

" -----------------------------
"  TreeSitter
" -----------------------------
lua  require('treesitter')

