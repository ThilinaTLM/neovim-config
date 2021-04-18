" -------- use vim config for neovim -------------------
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc
" ------------------------------------------------------

set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath=&runtimepath
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
    Plug 'glepnir/oceanic-material'
    Plug 'morhetz/gruvbox'
    
    " HTML Colors
    Plug 'ap/vim-css-color'
    
    " ------------------- Intergrations -----------------------
    " FZF for Vim
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    
    " Git intergration for vim 
    Plug 'jreybert/vimagit'
    
    " Fugitive is the premier Vim plugin for Git  [https://github.com/tpope/vim-fugitive]
    Plug 'tpope/vim-fugitive'
    
    " ------------------------ Tools ---------------------------
    " Floating Terminal
    Plug 'voldikss/vim-floaterm' 
    
    " Show live subsitution result
    Plug 'markonm/traces.vim'
    
    " Vim Wiki
    Plug 'vimwiki/vimwiki'

    " surround words with quotes
    Plug 'tpope/vim-surround'
    
    " ------------------ Autocompletion -------------------------
    " auto completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " ------------------- Language Specific ----------------------
    " Javascript
    Plug 'pangloss/vim-javascript'

" ------------------------------------------------------------
" end of vim plug list
call plug#end()

" --------------------------------------------------------------------------
"  Vim Close Pair
" --------------------------------------------------------------------------
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

vnoremap <leader>" "zdi"<c-r>z"
vnoremap <leader>' "zdi'<c-r>z'
vnoremap <leader>( "zdi(<c-r>z)
vnoremap <leader>[ "zdi[<c-r>z]
vnoremap <leader>{ "zdi{<c-r>z}

inoremap <expr> <bs> <SID>delpair()

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

inoremap <expr> " <SID>pairquotes('"')
inoremap <expr> ' <SID>pairquotes("'")


function! s:delpair()
	let l:lst = ['""',"''",'{}','[]','()']
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-2 : l:col-1]
	if index(l:lst, l:chr) > -1
		return "\<bs>\<del>"
	else
		" let l:chr = l:line[l:col-3:l:col-2]
		" if (index(l:lst, l:chr)) > - 1
		" 	return "\<bs>\<bs>"
		" endif
		return "\<bs>"
endf

function! s:escapepair(right)
	let l:col = col('.')
	let l:chr = getline('.')[l:col-1]
	if a:right == l:chr 
		return "\<right>"
	else
		return a:right

endf

function! s:pairquotes(pair)
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-1]
	if a:pair == l:chr 
		return "\<right>"
	else
		return a:pair.a:pair."\<left>"
endf

" ------------------------------------------------
"           ┬┌ ┬─┐┐ ┬┌┬┐┌─┐┬─┐┌─┤
"           ├┴┐├─ └┌┘││││─┤│─┘└─┐
"           ┴ ┘┴─┘ │ ┴ ┴┘ └┴  ├─┘
"             Personal Keymaps
" ------------------------------------------------

" Leader key
let mapleader = ','
inoremap kj <ESC>

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
"  COC Vim
" -----------------------------

" Coc goto the definition
function! s:GoToDefinition()
	if CocAction('jumpDefinition')
	  return v:true
	endif

	let ret = execute("silent! normal \<C-]>")
	if ret =~ "Error" || ret =~ "错误"
	  call searchdecl(expand('<cword>'))
	endif
endfunction

" Coc Explorer Tree
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }
nmap <space>e :CocCommand explorer<CR>
nmap <space>b :CocCommand explorer --preset buffer<CR>

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>cc  :CocCommand<CR>

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" -----------------------------
"  Airline Theme & ColorScheme
" -----------------------------

" ColorScheme
set background=dark
colorscheme gruvbox

let g:airline_theme='angr'
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

nnoremap <silent> <space>f :GitFiles<CR>
nnoremap <silent> <space>F :Files<CR>

" ----------------------------------------
"           ┌─┐┌─┐┌┐┬┬─┤┬┌─┐              
"           │  │ ││││├─ ││ ┬              
"           └─┘└─┘┴└┘┴  ┴└─┘              
"        Builtin Configuration
" ----------------------------------------

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
set wrap

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

