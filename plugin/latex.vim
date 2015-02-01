" === VIM-LATEX PACKAGE SETTINGS ===

" Compile to pdf by default
let g:Tex_DefaultTargetFormat    = 'pdf'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

" these settings are for making vim run faster on .tex files
autocmd FileType tex :NoMatchParen
au FileType tex setlocal nocursorline

" change this setting since it conflicts with ultisnips
imap <C-space> <Plug>IMAP_JumpForward

" save buffer before compiling
autocmd FileType tex call Tex_MakeMap('<leader>ll', ':update!<CR>:call Tex_RunLaTeX()<CR>', 'n', '<buffer>')
autocmd FileType tex call Tex_MakeMap('<leader>ll', '<ESC>:update!<CR>:call Tex_RunLaTeX()<CR>', 'v', '<buffer>')
