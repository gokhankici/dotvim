" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
set ff=unix

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif

" Cool Indentation
filetype plugin indent on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4

syn on
set number
set guifont=Inconsolata\ Medium\ 11
set background=dark
colorscheme solarized

"compile with g++
command GPP !g++ %:t -o %:t:r
command Crun ! %:t:r

" C++ compile and run
map <F9> :w<CR> :!g++ %:t -o %:t:r<CR> : ! %:t:r<CR>
" Java compile and run
map <F8> :w<CR> :!javac %:t<CR> : !java %:t:r<CR>


"full screen
set go-=T go-=b go-=F
set lines=50 columns=90

" select all
map <C-A> ggVG
" no sound or flash
set vb t_vb=

