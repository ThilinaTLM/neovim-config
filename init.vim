" -------- use vim config for neovim -------------------
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc
" ------------------------------------------------------
let curdir = expand('<sfile>:p:h')
execute 'set runtimepath+=' . curdir
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
    
    " -------------------- Autocompletion -------------------------

    Plug 'dense-analysis/ale' 
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1
    
" ----------------------------------------------------------
call plug#end()
" end of vim plug list
" ----------------------------------------------------------

" ----------------------------------------------------------
"              ┬  ┌─┤┬─┐  ┌─┐┌─┐┌┐┬┬─┤┬┌─┐
"              │  └─┐│─┘  │  │ ││││├─ ││ ┬
"              └─┘├─┘┴    └─┘└─┘┴└┘┴  ┴└─┘
"            Language Server Configurations
" ----------------------------------------------------------

let b:ale_fixers = {'javascript': ['tsserver']}
" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale', 'foobar'],
\})
let g:ale_completion_autoimport = 1

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


" -----------------------------
"  Netrw File Manager
" -----------------------------
let g:netrw_banner = 0
let g:netrw_linestyle = 3
let g:netrw_winsize = 15
let g:netrw_browse_split = 4 " file with :vsplit to the right of the browser.
let g:netrw_altv = 1
let g:netrw_liststyle = 3 " Default to tree mode
let g:netrw_fastbrowse = 0

" Toggle Vexplore 
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec 'wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

" If another buffer tries to replace NetrwTree, put it in the other window, and bring back NetrwTree.
autocmd BufEnter * if bufname('#') =~ 'NetrwTreeListing' && bufname('%') !~ 'NetrwTreeListing' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

autocmd FileType netrw setl bufhidden=wipe

" Toggle explorer with Ctrl-E
map <silent> <C-e> :call ToggleVExplorer()<CR>

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

