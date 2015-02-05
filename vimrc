" Must come first because it changes other options.
set nocompatible
filetype off

" fix some weird windows bug
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
filetype off
Bundle 'a.vim'
Bundle 'acx0/Conque-Shell'
Bundle 'AutoClose'
Bundle 'bufexplorer.zip'
Bundle 'edsono/vim-matchit'
Bundle 'FuzzyFinder'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'rbonvall/vim-textobj-latex'
Bundle 'L9'
Bundle 'Liquid-Carbon'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'noahfrederick/vim-hemisu'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'operator-user'
Bundle 'recover.vim'
Bundle 'rhysd/vim-clang-format'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vinegar'
Bundle 'vimwiki/vimwiki'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'
Plugin 'bling/vim-airline'
Plugin 'honza/vim-snippets'
Plugin 'noerrmsg.vim' " disable error messages that YCM generates
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/unite.vim'
Plugin 'SirVer/ultisnips'
Plugin 'jceb/vim-orgmode'
Plugin 'nixon/vim-vmath'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'moll/vim-bbye'

if expand("$USER") != 'safedispatch'
	Bundle 'taglist.vim'
	Plugin 'Valloric/YouCompleteMe'
endif

" haskell
Bundle 'wlangstroth/vim-haskell'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'neco-ghc'
Bundle 'scrooloose/syntastic'
Plugin 'Shougo/vimproc.vim'
"Plugin 'dag/vim2hs'
Plugin 'travitch/hasksyn'
Plugin 'kana/vim-textobj-indent'
Plugin 'bitc/vim-hdevtools'
Plugin 'Twinside/vim-hoogle'
" Colorschemes
Plugin 'chriskempson/base16-vim'
Bundle 'shawncplus/skittles_berry'
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
Plugin 'sjl/badwolf'
filetype plugin indent on

let g:Powerline_symbols = 'fancy'
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" Set CtrlP command
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPBuffer'

" use silver-searcher for file system search
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ackprg = 'ag --nogroup --nocolor --column'

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
set relativenumber
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set cursorline " highlight current line

set lazyredraw
set ttyfast

" auto directory
"set acd
" side scroll off
set siso=0

" scroll bars
set guioptions+=LlRrb
set guioptions-=LlRrb
" hide toolbar
set guioptions-=T

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

" add scrolling for html,tex and txt types
au FileType html,tex,text,org noremap <buffer> j gj
au FileType html,tex,text,org noremap <buffer> k gk
au FileType html,tex,text,org noremap <buffer> 0 g0
au FileType html,tex,text,org noremap <buffer> $ g$

" do not split words at the end of the screen
set linebreak

" Map <C-s><C-s> or <C-g>S in surround to <C-k>
imap <C-k> <C-g>S

"" Change directory to home at startup
"" NerdTREE sees C:\ as initial directory
"autocmd VimEnter * cd ~

"Resize the windows with Alt key
map <silent><A-Left>  <C-w><
map <silent><A-Right> <C-w>>
map <silent><A-Up>    <C-w>+
map <silent><A-Down>  <C-w>-

" PEEPCODE ADDITIONS ------------------------------------------------
set showcmd                     " Display incomplete commands.
set showmode                    " Display the mode you're in.
set hidden                      " Handle multiple buffers better.
set smartcase                   " But case-sensitive if expression contains a capital letter.
set laststatus=2                " Show the status line all the time

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
"map <leader>e :NERDTreeFind<CR>:NERDTreeMirror<CR>
"map <leader>e :NERDTreeFind<CR>:NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
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

" Make it so that a curly brace automatically inserts an indented line
"inoremap {<CR> {<CR>}<Esc>O<BS><Tab>}

" Switches on spell checking
autocmd FileType txt,tex setlocal spell spelllang=en_us

" Empty space at the bottom of gVim windows
set guiheadroom=0

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" === C, C++ FORMATTING ===
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "BreakBeforeBraces" : "Allman",
			\ "TabWidth" : 4,
			\ "UseTab" : "Always",
			\ "Standard" : "C++11"}

augroup ClangFormatSettings
	autocmd!
	" map to <Leader>cf in C++ code
	autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
	autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
	" if you install vim-operator-user
	autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
augroup END

" === ULTISNIPS PACKAGE SETTINGS ===
" Track the engine.
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips","UltiSnips"]
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" === YOUCOMPLETEME PACKAGE SETTINGS ===
autocmd FileType c,cpp,objc map gd :YcmCompleter GoTo<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

"let g:ycm_semantic_triggers = {'haskell' : ['.']}

" Relative line numbers
function! DisableRelative()
	set norelativenumber
	set number
endfunc
function! NumberToggle()
	if(&relativenumber == 1)
		call DisableRelative()
	else
		set relativenumber
	endif
endfunc
"nnoremap <C-l> :call NumberToggle()<CR>
:au FocusLost * :call DisableRelative()
:au FocusGained * :set relativenumber
autocmd InsertEnter * :call DisableRelative()
autocmd InsertLeave * :set relativenumber

" === disable fold at startup
autocmd BufWinEnter * silent! :%foldopen!

" === clear whitespace when saving
autocmd BufWritePre * :call RemoveTrailingWhitespace()

" === vimfiler options ===
let g:vimfiler_as_default_explorer = 1

" vim-vmath key maps
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

