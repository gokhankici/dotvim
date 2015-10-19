# Path to your oh-my-zsh installation.
export ZSH=/home/gokhan/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast)

# User configuration

export PATH="\
/home/gokhan/.opam/system/bin:\
/usr/local/texlive/2014/bin/x86_64-linux:\
/usr/local/go/bin:\
$HOME/.local/bin:\
$HOME/libs/z3/bin:\
$HOME/libs/llvm3.7/llvm-build/Release+Asserts/bin:\
$HOME/libs/node-v0.12.3/install/bin:\
$HOME/gogogo/bin:\
$HOME/libs/scala-2.11.7/bin:\
$HOME/bin:\
$HOME/work/spin/bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/sbin:\
/usr/bin:\
/sbin:\
/bin:\
/usr/games:\
/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# ##########################################################################
# ############################## MY ADDITIONS ##############################
# ##########################################################################

export TERM=xterm-256color

# ##################################################
# ENV
# ##################################################
export EDITOR='vim'
export GOPATH="$HOME/gogogo"

# ##################################################
# ALIASES
# ##################################################
alias tlmgr="cd $(dirname $(which tlmgr)) && sudo ./tlmgr -gui"
alias t='TERM=screen-256color tmux'
alias ta='TERM=screen-256color tmux attach -t'
alias tl='TERM=screen-256color tmux list-sessions'
alias tmux-takeover='TERM=screen-256color tmux detach-client -a -s'

alias sem='cd /home/gokhan/Dropbox/UCSD\ Academic/Quarter\ 2\ -\ Winter\ 2015'

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias setclip_nl='head -c -1 | setclip'

alias open='xdg-open'

alias e='emacsclient -nw'

# ##################################################
# Base16 Shell
# ##################################################
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# ##################################################
# FUNCTIONS
# ##################################################
start_in_tmux () {
	if $(tmux list-sessions | grep $1) ; then
		TERM=screen-256color tmux attach -t $1
	else
		TERM=screen-256color tmux new -s $1 $1
	fi
}

irc () {
	ssh -t goto "TERM=screen-256color /home/rkici/local/bin/tmux attach -t rcirc"
}

# OPAM configuration
. /home/gokhan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
