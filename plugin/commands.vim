"compile with g++
command GPP !g++ %:t -o %:t:r
command Crun !%:t:r


" My function to delete all buffers and close vim
function DeleteAllAndClose(ignore)
	if(a:ignore)
		bufdo bd!
	else
		bufdo bd
	endif
	qa
endfunction
command -nargs=? QA call DeleteAllAndClose(0)
command -nargs=? QAI call DeleteAllAndClose(1)


" User defined function to remove trailing whitespace
function! RemoveTrailingWhitespace()
	%s/\s\+$//e
	noh
endfunction
command RT call RemoveTrailingWhitespace()


" === copy file name
function! CopyFileName()
	let @+=expand("%:p")
endfunction
noremap <silent> <F4> :let @+=expand("%:p")<CR>
command CopyFileName :call CopyFileName()


" Use python to create a calculator
command! -nargs=+ Calc :py print <args>
py from math import *


" Paste the output of the function to the buffer
function! PasteMessage(cmd)
	redir => message
	silent execute a:cmd
	redir END
	"tabnew
	silent put=message
	set nomodified
endfunction
command! -nargs=+ -complete=command PasteMessage call PasteMessage(<q-args>)


" Copies the search matches to the given register
function! CopyMatches(reg)
	let hits = []
	%s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
	let reg = empty(a:reg) ? '+' : a:reg
	execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
"
" remove the trailing whitespace
function! Chomp(input_string)
	return substitute(a:input_string, '^\(.\{-}\)[ \t\n\r]*$', '\1', '')
endfunction

" replace each space with an escaped one
function! ReplaceSpace(input_string)
	return substitute(a:input_string, ' ', '\\ ', 'g')
endfunction

" run make command with F2 in a 'smart' way
function! MyMake(file)
	let l:mf = system("find_up '" . a:file ."' makefile | xargs -I {} dirname '{}'")
	let l:mf = Chomp(ReplaceSpace(l:mf))
	if len(l:mf)
		exec "make --no-print-directory -C " . l:mf
		redraw
	else
		echo "No makefile found"
	endif
endfunction
command! MyMake call MyMake(expand("%:p"))
map <F2> :MyMake<CR>


command! Terminal :! xfce4-terminal --working-directory="%:h" &

