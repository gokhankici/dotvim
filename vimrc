set nocompatible  	" Must come first because it changes other options.

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Coding
syntax on
filetype plugin indent on
set number
filetype plugin on		" for nerd commenter
set smartindent
set autoindent
" set tabstop=4
" set shiftwidth=4

set acd				" auto directory
set siso=0			" side scroll off
" set lines=44

set guioptions+=LlRrb 		" scroll bars
set guioptions-=LlRrb

"compile with g++
command GPP !g++ %:t -o %:t:r
command Crun !%:t:r

" C++ compile and run
map <F9> :w<CR> :!g++ %:t -o %:t:r<CR> : !%:t:r<CR>
" Java compile and run
map <F8> :w<CR> :!javac %:t<CR> : !java %:t:r<CR>

"full screen
"set go-=T go-=b go-=F
"set lines=50 columns=90

" select all
map <C-A> ggVG
" no sound or flash
set vb t_vb=


" PEEPCODE ADDITIONS ------------------------------------------------

set showcmd      		" Display incomplete commands.
set showmode                    " Display the mode you're in.

set hlsearch			" highlight search (very useful!)
set incsearch			" search incremently (search while typing)

set backspace=indent,eol,start  " Intuitive backspacing.

set hidden                      " Handle multiple buffers better.

set wildmenu                    " Enhanced command line completion.
" set wildmode=list:longest     " Complete files like a shell.

set ignorecase                  " Case-insensitive searching.
set smartcase                   " But case-sensitive if expression contains a capital letter.

set laststatus=2                " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

vmap > >gv			" Shift text right and re-select
vmap < <gv			" Shift text left and re-select

" PEEPCODE ADDITIONS ------------------------------------------------


