" Must come first because it changes other options.
set nocompatible
filetype off

if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

	"Open the current directory with Console2
	:function OpenConsole2InPWD(path)
	:	let new_path = substitute(a:path, "Rami[^\\]*", "RamiGökhan", "")
	:	call xolox#misc#os#exec({'command' : "\"C:\\Program Files\\Console2\\Console.exe\"\ -d\ \"".new_path."\"", 'async' : 1})
	:endfunction

	":command -nargs=? CMD call OpenConsole2InPWD(expand("%:p:h"))
	:command -nargs=? CMD call xolox#misc#os#exec({'command' : '"C:\\Program Files\\Console2\\Console.exe" -d "C:\\Users\\RamiGökhan"', 'async' : 1})
endif

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
"Bundle 'CSApprox'
"Bundle 'LaTeX-Box-Team/LaTeX-Box'
"Bundle 'Lokaltog/powerline', {'rtp':  'powerline/bindings/vim'}
"Bundle 'ervandew/supertab'
Bundle 'AutoClose'
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'Liquid-Carbon'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'a.vim'
Bundle 'acx0/Conque-Shell'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bufexplorer.zip'
Bundle 'edsono/vim-matchit'
Bundle 'flazz/vim-colorschemes'
Bundle 'garbas/vim-snipmate'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
Bundle 'gmarik/vundle'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'noahfrederick/vim-hemisu'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'recover.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'shawncplus/skittles_berry'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vinegar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vimwiki/vimwiki'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'

Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'


let g:Powerline_symbols = 'fancy'

" Set CtrlP command
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPBuffer'

if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0

	autocmd VimEnter * nmap <leader>f :CtrlP<CR>

	" bind \ (backward slash) to grep shortcut
	command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

	nnoremap \ :Ag<SPACE>

	" bind K to grep word under cursor
	nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
else
	"Map this function at runtime since other way didn't worked
	autocmd VimEnter * nmap <leader>f :FufFile<CR>
endif

" Coding
syntax on
filetype plugin indent on
set number
filetype plugin on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set cursorline " highlight current line

" auto directory
"set acd
" side scroll off
set siso=0
" set lines=44

" scroll bars
set guioptions+=LlRrb
set guioptions-=LlRrb
" hide toolbar
set guioptions-=T

"compile with g++
command GPP !g++ %:t -o %:t:r
command Crun !%:t:r

" C++ compile and run
map <F9> :w<CR> :!g++ %:t -o %:t:r<CR> : !./%:t:r<CR>
" Java compile and run
map <F8> :w<CR> :!javac %:t<CR> : !java %:t:r<CR>

" select all
map <C-A> ggVG
" no sound or flash
set vb t_vb=

" set background
se t_Co=256
set background=dark
" Access colors present in 256 colorspace"
let base16colorspace=256
colorscheme base16-default
"colorscheme desert
"colorscheme skittles_berry

" add scrolling for html,tex and txt types
au FileType html,tex,text noremap <buffer> j gj
au FileType html,tex,text noremap <buffer> k gk
au FileType html,tex,text noremap <buffer> 0 g0
au FileType html,tex,text noremap <buffer> $ g$

" do not split words at the end of the screen
set linebreak

" Map <C-s><C-s> or <C-g>S in surround to <C-k>
imap <C-k> <C-g>S

" For vim - tmux incompatibility for arrow keys
nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

" My function to delete all buffers and close vim
:function DeleteAllAndClose(ignore)
:	if(a:ignore)
:		bufdo bd!
:	else
:		bufdo bd
:	endif
:	qa
:endfunction

:command -nargs=? QA call DeleteAllAndClose(0)
:command -nargs=? QAI call DeleteAllAndClose(1)

" Change directory to home at startup
" NerdTREE sees C:\ as initial directory
autocmd VimEnter * cd ~

"Resize the windows with Alt key
map <silent><A-Left> <C-w><
map <silent><A-Right> <C-w>>
map <silent><A-Up> <C-w>+
map <silent><A-Down> <C-w>-

" PEEPCODE ADDITIONS ------------------------------------------------

set showcmd                     " Display incomplete commands.
set showmode                    " Display the mode you're in.
set hidden                      " Handle multiple buffers better.
set smartcase                   " But case-sensitive if expression contains a capital letter.
set laststatus=2                " Show the status line all the time

" Useful status information at bottom of screen
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"" Tab mappings.
"map <leader>tt :tabnew<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>to :tabonly<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>
"map <leader>tf :tabfirst<cr>
"map <leader>tl :tablast<cr>
"map <leader>tm :tabmove

" Shift text right and re-select
vmap > >gv
" Shift text left and re-select
vmap < <gv

" PEEPCODE ADDITIONS ------------------------------------------------

"  SPF-13 ADDITIONS ------------------------------------------------
" VIM UI
set backspace=indent,eol,start  " backspace for dummies
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor

" Key (re)Mappings

let mapleader=','

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Plugins

map <leader>e :NERDTreeToggle<CR>:NERDTreeMirror<CR>
"  SPF-13 ADDITIONS ------------------------------------------------

set encoding=utf-8
set fileencoding=utf-8

" Bubble single line
nmap <C-S-up> [e
nmap <C-S-down> ]e

" Bubble multiple lines
vmap <C-S-up> [egv
vmap <C-S-down> ]egv

"Easy ESC
inoremap kj <ESC>

"command -nargs=? CMD !gnome-terminal expand("%:p:h") &
command TERM !gnome-terminal . &

" Open nautilus in the current folder
command NAUTILUS !nautilus . &

" === VIM-LATEX PACKAGE SETTINGS ===

" Compile to pdf by default
let g:Tex_DefaultTargetFormat = 'pdf'

" these settings are for making vim run faster on .tex files
autocmd FileType tex :NoMatchParen
au FileType tex setlocal nocursorline

" === VIM-LATEX PACKAGE SETTINGS ===

map <leader>t :ConqueTerm bash<cr>

" Make it so that a curly brace automatically inserts an indented line
inoremap {<CR> {<CR>}<Esc>O<BS><Tab>}

" Switches on spell checking
setlocal spell spelllang=en_us

" Empty space at the bottom of gVim windows
set guiheadroom=0

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" User defined function to remove trailing whitespace
:function RemoveTrailingWhitespace()
:%s/\s\s*$//g
:noh
:endfunction

command RT call RemoveTrailingWhitespace()

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
