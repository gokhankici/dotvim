augroup filetype
	au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

augroup filetype
	au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END
