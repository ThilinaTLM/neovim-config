inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

vnoremap <leader>" "zdi"<c-r>z"
vnoremap <leader>' "zdi'<c-r>z'
vnoremap <leader>( "zdi(<c-r>z)
vnoremap <leader>[ "zdi[<c-r>z]
vnoremap <leader>{ "zdi{<c-r>z}

inoremap <expr> <bs> <SID>delpair()
inoremap <expr> <cr> <SID>auto_indent()

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

inoremap <expr> " <SID>pairquotes('"')
inoremap <expr> ' <SID>pairquotes("'")

function! s:auto_indent()
	let l:lst = ['""',"''",'{}','[]','()']
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-2 : l:col-1]
	if (index(l:lst, l:chr)) > - 1
		return "\<cr>\<cr>\<up>\<tab>"
	else
		return "\<cr>"
	endif
endf

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
    let l:prev = l:line[l:col-2]
	if a:pair == l:chr 
		return "\<right>"
    elseif matchstr(l:chr, '\w') != '' || matchstr(l:prev, '\w') != ''
        return a:pair
	else
		return a:pair.a:pair."\<left>"
endf
