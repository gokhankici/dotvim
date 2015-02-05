" Tabular plugin mapppings
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>

	AddTabularPattern! hs /^.\{-}\zs\(::\|=\||\)/l1r1
endif
