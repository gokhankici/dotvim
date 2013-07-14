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
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive' 
Bundle 'tpope/vim-surround' 
Bundle 'scrooloose/nerdtree' 
Bundle 'scrooloose/nerdcommenter' 
Bundle 'kien/ctrlp.vim'
Bundle 'AutoClose'
Bundle 'shawncplus/skittles_berry'
Bundle 'edsono/vim-matchit'
"Bundle 'msanders/snipmate.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tlib'
Bundle 'L9'
Bundle 'FuzzyFinder'
"Bundle 'Lokaltog/powerline'
"Bundle 'mileszs/ack.vim'
Bundle 'a.vim'
Bundle 'ervandew/supertab'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-repeat'
Bundle 'xolox/vim-shell'
Bundle 'xolox/vim-misc'

" Set CtrlP command
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPBuffer'

" Coding
syntax on
filetype plugin indent on
set number
filetype plugin on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4

" auto directory
set acd					
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
colorscheme desert
"set background=dark
"colorscheme solarized
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

"Map this function at runtime since other way didn't worked
autocmd VimEnter * nmap <leader>f :FufFile<CR>

"Resize the windows with Alt key
map <silent><A-Left> <C-w><
map <silent><A-Right> <C-w>>
map <silent><A-Up> <C-w>+
map <silent><A-Down> <C-w>-

" PEEPCODE ADDITIONS ------------------------------------------------

set showcmd      		" Display incomplete commands.
set showmode                    " Display the mode you're in.
set hidden                      " Handle multiple buffers better.
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
