" This must come first because it changes other options.
set nocompatible
filetype off

" fix some weird windows bug
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

function! IsRemoteUser()
	let l:username = expand('$USER')
	let l:hostname = hostname()
	if l:username == "safedispatch"
		return 1
	elseif l:username == "rkici"
		return 1
	elseif l:hostname == "chromebuild"
		return 1
	else
		return 0
	endif
endfunc

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
filetype off
Plugin 'gmarik/vundle'
Plugin 'a.vim'                                       | "alternate files quickly .c -> .h
Plugin 'AutoClose'                                   | "autoclose chars
Plugin 'edsono/vim-matchit'                          | "extended % matching for HTML, LaTeX, etc.
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex' | "latex mode

Plugin 'kien/ctrlp.vim'                  | "Fuzzy file, buffer, mru, tag, etc finder
Plugin 'kana/vim-textobj-user'           | "user defined text objects
Plugin 'rbonvall/vim-textobj-latex'      | "text objects for latex
Plugin 'Lokaltog/vim-easymotion'         | "Vim motions on speed!
Plugin 'mileszs/ack.vim'                 | "Vim plugin for the Perl module / CLI script 'ack'
Plugin 'nelstrom/vim-visual-star-search' | "Start a * or # search from a visual block
Plugin 'operator-user'                   | "Define your own operator easily
Plugin 'recover.vim'                     | "diff between the recovered and opened file
Plugin 'rhysd/vim-clang-format'          | "vim plugin for clang-format
Plugin 'scrooloose/nerdcommenter'        | "comment easily !
Plugin 'tpope/vim-tbone'                 | "Send text to tmux window
Plugin 'tpope/vim-abolish'               | "easily search for, substitute, and abbreviate multiple variants of a word
Plugin 'tpope/vim-repeat'                | "enable repeating supported plugin maps with '.'
Plugin 'tpope/vim-surround'              | "quoting/parenthesizing made simple
Plugin 'tpope/vim-unimpaired'            | "pairs of handy bracket mappings
Plugin 'xolox/vim-misc'                  | "Miscellaneous auto-load Vim scripts
Plugin 'bling/vim-airline'               | "lean & mean status/tabline for vim that's light as air
Plugin 'honza/vim-snippets'              | "snipMate & UltiSnip Snippets
Plugin 'noerrmsg.vim'                    | "disable error messages that YCM generates
Plugin 'Shougo/vimfiler.vim'             | "Powerful file explorer implemented by Vim script
Plugin 'Shougo/unite.vim'                | "Unite and create user interfaces
Plugin 'SirVer/ultisnips'                | "ultimate snippet solution for vim !
Plugin 'godlygeek/tabular'               | "insanely useful text alignment
Plugin 'airblade/vim-gitgutter'          | "shows a git diff in the gutter
Plugin 'moll/vim-bbye'                   | "adds the Bdelete command
Plugin 'neilagabriel/vim-geeknote'       | "integrates geeknote (cmd interface for Evernote)

if ! IsRemoteUser()
	"Plugin 'taglist.vim'                   | "source code browser
	Plugin 'ntpeters/vim-better-whitespace' | "Better whitespace highlighting for Vim
	"Plugin 'Valloric/YouCompleteMe'        | "auto-completion plugin for C & Python
endif

"haskell
Plugin 'wlangstroth/vim-haskell'  | "vim configuration for haskell
Plugin 'Shougo/neocomplcache.vim' | "Ultimate auto-completion system for Vim
Plugin 'eagletmt/ghcmod-vim'      | "type, check & lint, and expanding
Plugin 'neco-ghc'                 | "completion plugin for Haskell, using ghc-mod
Plugin 'scrooloose/syntastic'     | "syntax checking plugin
Plugin 'Shougo/vimproc.vim'       | "Interactive command execution in Vim.
Plugin 'travitch/hasksyn'         | "highlight and indent Haskell source code
Plugin 'kana/vim-textobj-indent'  | "select similarly indented lines
Plugin 'bitc/vim-hdevtools'       | "persistent bg server for Haskell devtools
Plugin 'Twinside/vim-hoogle'      | "Vim plugin used to query hoogle, the haskell search engine
Plugin 'jpalardy/vim-slime'

"Colorschemes
Plugin 'chriskempson/base16-vim'
"Plugin 'shawncplus/skittles_berry'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/badwolf'

" go
"Plugin 'fatih/vim-go'

" ocaml
Plugin 'def-lkb/ocp-indent-vim' | "better indentation for OCaml files

" scala
Plugin 'derekwyatt/vim-scala'

filetype plugin indent on

"================================================================================
" general settings
"================================================================================
syntax on

set autoindent
set background=dark
set backspace=indent,eol,start | " backspace for dummies
set cursorline                 | " highlight current line
set encoding=utf-8
set fileencoding=utf-8
set guiheadroom=0              | " Empty space at the bottom of gVim windows
set guioptions+=LlRrb          | " scroll bars
set guioptions-=LlRrb
set guioptions-=T              | " hide toolbar
set hidden                     | " Handle multiple buffers better.
set hlsearch                   | " highlight search terms
set ignorecase                 | " case insensitive search
set incsearch                  | " find as you type search
set laststatus=2               | " Show the status line all the time
set lazyredraw                 | " faster drawings
set linebreak                  | " do not split words at the end of the screen
set modeline
set relativenumber             | " line numbers become relative to the current line
set scrolljump=5               | " lines to scroll when cursor leaves screen
set scrolloff=3                | " minimum lines to keep above and below cursor
set shiftwidth=4
set showcmd                    | " Display incomplete commands.
set showmatch                  | " show matching brackets/parenthesis
set showmode                   | " Display the mode you're in.
set siso=0                     | " side scroll off
set smartcase                  | " But case-sensitive if expression contains a capital letter.
set smartcase                  | " case sensitive when uc present
set smartindent
set t_Co=256
set tabstop=4
set ttyfast
set vb t_vb=                   | " no sound or flash
set whichwrap=b,s,h,l,<,>,[,]  | " backspace and cursor keys wrap to
set wildmenu                   | " show list instead of just completing
set wildmode=list:longest,full | " command <Tab> completion, list matches, then longest common part, then all.
set winminheight=0             | " windows can be 0 line high

let base16colorspace=256       | " Access colors present in 256 colorspace
colorscheme base16-default

au FileType html,tex,text,org noremap <buffer> j gj
au FileType html,tex,text,org noremap <buffer> k gk
au FileType html,tex,text,org noremap <buffer> 0 g0
au FileType html,tex,text,org noremap <buffer> $ g$

" Switches on spell checking
autocmd FileType txt,tex setlocal spell spelllang=en_us

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" disable fold at startup
autocmd BufWinEnter * silent! :%foldopen!

" clear whitespace when saving
if ! IsRemoteUser()
	autocmd BufWritePre * :call RemoveTrailingWhitespace()
endif

"================================================================================
" key mappings
"================================================================================
" remap leader key
let mapleader=','

"" Tab shortcuts
"nnoremap <leader>tt :tabnew<cr>
"nnoremap <leader>te :tabedit
"nnoremap <leader>tc :tabclose<cr>
"nnoremap <leader>to :tabonly<cr>
"nnoremap <leader>tn :tabnext<cr>
"nnoremap <leader>tp :tabprevious<cr>
"nnoremap <leader>tf :tabfirst<cr>
"nnoremap <leader>tl :tablast<cr>
"nnoremap <leader>tm :tabmove

nnoremap <C-A> ggVG

"Resize the windows with Alt key
nnoremap <silent><A-Left>  <C-w><
nnoremap <silent><A-Right> <C-w>>
nnoremap <silent><A-Up>    <C-w>+
nnoremap <silent><A-Down>  <C-w>-

" Shift text and re-select
vnoremap > >gv
vnoremap < <gv

" Easier moving in tabs and windows
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
nnoremap <C-L> <C-W>l<C-W>_
nnoremap <C-H> <C-W>h<C-W>_

" Bubble single line
nnoremap <C-S-up> [e
nnoremap <C-S-down> ]e

" Bubble multiple lines
vnoremap <C-S-up> [egv
vnoremap <C-S-down> ]egv

"Easy ESC
inoremap kj <ESC>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" start NERDTree
"nnoremap <leader>e :NERDTreeFind<CR>
nnoremap <leader>e :VimFilerBufferDir<CR>
let g:vimfiler_as_default_explorer = 1

" vim-vmath key maps
vnoremap <expr>  ++  VMATH_YankAndAnalyse()
nnoremap         ++  vip++

"================================================================================
" airline
"================================================================================
if IsRemoteUser()
	let g:airline#extensions#whitespace#mixed_indent_algo = 0
	let g:airline#extensions#whitespace#enabled           = 0
else
	let g:airline#extensions#whitespace#mixed_indent_algo = 1
	let g:airline_powerline_fonts = 1
endif

"================================================================================
" ctrlp
"================================================================================
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPBuffer'

"================================================================================
" ag
"================================================================================
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ackprg = 'ag --nogroup --nocolor --column'

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0

	"autocmd VimEnter * nmap <leader>f :CtrlP<CR>

	" bind \ (backward slash) to grep shortcut
	command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

	nnoremap \ :Ag<SPACE>

	" bind K to grep word under cursor
	nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
else
	"Map this function at runtime since other way didn't worked
	"autocmd VimEnter * nmap <leader>f :FufFile<CR>
endif

"================================================================================
" clang formatter settings
"================================================================================
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

"================================================================================
" ultisnips settings
"================================================================================
" Track the engine.
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips","UltiSnips"]
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

"================================================================================
" youcompleteme settings
"================================================================================
autocmd FileType c,cpp,objc map gd :YcmCompleter GoTo<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:ycm_confirm_extra_conf = 0                 | " Do not ask when starting vim
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

"================================================================================
" line number toggle
"================================================================================
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
:au FocusLost * :call DisableRelative()
:au FocusGained * :set relativenumber
autocmd InsertEnter * :call DisableRelative()
autocmd InsertLeave * :set relativenumber

"================================================================================
" vimfiler
"================================================================================
let g:vimfiler_as_default_explorer = 1

"================================================================================
" vim-better-whitespace
"================================================================================
if ! IsRemoteUser()
	let g:better_whitespace_filetypes_blacklist = ['unite']
endif

"================================================================================
" unite settings & mappings
"================================================================================
call unite#filters#matcher_default#use(['matcher_fuzzy']) | " always use fuzzy match

nnoremap <leader>f :Unite -start-insert file<cr>

" yank history like yankring
let g:unite_source_history_yank_enable = 1
nnoremap <leader>p :Unite history/yank<cr>

"================================================================================
" GNU GLOBAL settings
"================================================================================
set csprg=gtags-cscope
"cscope add /foo/bar/GTAGS

nnoremap <leader>gg :execute 'Unite gtags/def:'.expand('<cword>')<CR>
nnoremap <leader>gc :execute 'Unite gtags/context'<CR>
nnoremap <leader>gr :execute 'Unite gtags/ref'<CR>
nnoremap <leader>ge :execute 'Unite gtags/grep'<CR>
vnoremap <leader>gg <ESC>:execute 'Unite gtags/def:'.GetVisualSelection()<CR>

"================================================================================
" syntastic
"================================================================================
let g:syntastic_mode_map = {
			\ 'mode': 'passive',
			\ 'active_filetypes': [],
			\ 'passive_filetypes': [] }

"send to tmux
vnoremap <leader>t :Twrite<CR>
nnoremap <leader>t :% Twrite<CR>

function! TillHereToTmux()
	let l:curline = line(".")
	exec '1,'.l:curline.'Twrite'
endfunction
nnoremap <silent> <leader>T :call TillHereToTmux()<CR>

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
