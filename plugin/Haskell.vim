" --- syntastic -------------------------------
map <Leader>s :SyntasticToggleMode<CR>

" recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" --- ghc-mod ---------------------------------
" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

" --- hdevtools -------------------------------
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

let g:haddock_browser = 'chromium'
"let g:ghc="/usr/bin/ghc"
"au BufEnter *.hs compiler ghc

" Use space instead of tabs
autocmd BufRead,BufNewFile *.hs,*.lhs setlocal expandtab
