" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2  	" Make command line two lines high
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
  " highlight Normal guibg=grey90
  " highlight Cursor guibg=Green guifg=NONE
  " highlight lCursor guibg=Cyan guifg=NONE
  " highlight NonText guibg=grey80
  " highlight Constant gui=NONE guibg=grey95
  " highlight Special gui=NONE guibg=grey95

endif

" no sound or flash
set vb t_vb=

set background=dark

" set guifont=DejaVu\ Sans\ Mono\ 10

" Try to remember gvim size and position
"set sessionoptions+=resize,winpos
"autocmd VIMEnter * :source C:/Users/Gokhan/session.vim
"autocmd VIMLeave * :mksession! C:/Users/Gokhan/session.vim

" Colorscheme suggestions
" 	Light color schemes:
" 		louver: 	like basic windows theme, good colors
" 		mayansmoke: good but comments are very muted
" 		pyte: 		like mayansmoke but more muted
" 		solarized: 	always a choice
" 	Dark color schemes:
" 		solarized: 	dark one is better
" 		wombat: 	good colors
" 		desert: 	very good one

if has('win32') || has('win64')
	set guifont=DejaVu_Sans_Mono:h11:cANSI
else
	"set guifont=DejaVu\ Sans\ Mono\ 14
	set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
endif
