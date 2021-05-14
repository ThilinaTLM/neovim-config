
set runtimepath^=~/.config/nvim 
set runtimepath+=~/.config/nvim/after
let &packpath=&runtimepath
let g:config_dir='/home/tlm/.config/nvim'
let g:script_dir=g:config_dir.'/scripts'
" ------------------------------------------------------

set nocompatible
filetype plugin on
syntax enable

" Plugins
lua require('plugins')

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
nnoremap <silent> <space>q  :bd<CR>
nnoremap <silent> <space>l  :BufferLineCycleNext<CR>
nnoremap <silent> <space>h  :BufferLineCyclePrev<CR>
nnoremap <silent> <space>b  :BufferLinePick<CR>

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
lua require("nvim_tree")

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
highlight NvimTreeGitNew guibg=yellow

nnoremap <space>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" -----------------------------------
"  Naitive LSP and Autocompletion
" -----------------------------------
lua require('lsp_config')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" nvim-compe with using delimitMate 
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" highlight
highlight link CompeDocumentation NormalFloat

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
lua require("conf_telescope")

nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>

" Quick Use Commands
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

let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

" -----------------------------
"  Bufferline
" -----------------------------
lua require'bufferline'.setup{}

" -----------------------------
"  TreeSitter
" -----------------------------
lua  require('treesitter')

" Options
lua require('options')
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smartindent
set smarttab
