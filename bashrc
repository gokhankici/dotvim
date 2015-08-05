# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

 #if [ "$color_prompt" = yes ]; then
	 #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
 #else
	 #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
 #fi

PS1="${debian_chroot:+($debian_chroot)}\n\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \n\$>\[\033[00m\] "
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls --color -h --group-directories-first -alF'
alias la='ls --color -h --group-directories-first -A'
alias l='ls --color -h --group-directories-first -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ...............................................................................
# ... MY ADDITIONS ..............................................................
# ...............................................................................

kill_emacs ()
{
	# finds the pid of the emacs daemon process and kills it
	# kill the first one since the second one is the `grep` process
	ps aux | grep "emacs --daemon" | awk '{if (NR == 1) {print $2}}' | xargs kill
}

alias e='emacsclient --nw'

#export PIN_HOME="/home/gokhan/Library/pin-2.13-62141-gcc.4.4.7-linux"
#export PIN_ROOT="/home/gokhan/Library/pin-2.13-62141-gcc.4.4.7-linux"

export PATH="/usr/local/texlive/2014/bin/x86_64-linux:\
.cabal-sandbox/bin:\
$HOME/.cabal/bin:\
$HOME/libs/z3/bin:\
$HOME/Documents/230hw4/.cabal-sandbox/bin:\
$HOME/libs/llvm3.7/llvm-build/Release+Asserts/bin:\
$HOME/libs/node-v0.12.3/install/bin:\
$PATH"

export INFOPATH="$INFOPATH:/usr/local/texlive/2014/texmf-dist/doc/info"
export MANPATH="$MANPATH:/usr/local/texlive/2014/texmf-dist/doc/man"

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:\
/usr/local/lib:\
$LD_LIBRARY_PATH"

TLMGR_DIR=$(dirname $(which tlmgr))

alias cd..="cd .."

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

alias tlmgr="cd $TLMGR_DIR && sudo ./tlmgr -gui"

# tmux stuff

tn ()
{
	TERM=screen-256color tmux new -s $1 $1
}

re ()
{
	readelf -a $1 | less
}

start_in_tmux ()
{
	if [[ $(tmux list-sessions | grep $1) ]]; then
		TERM=screen-256color tmux attach -t $1
	else
		TERM=screen-256color tmux new -s $1 $1
	fi
}

alias t='TERM=screen-256color tmux'
alias ta='TERM=screen-256color tmux attach -t'
alias tl='tmux list-sessions'
alias tmux-takeover='tmux detach-client -a -s'

alias wee='start_in_tmux weechat'
alias m='start_in_tmux mps'
alias my='mpsyt'

#mount_goto ()
#{
	#sudo sshfs -o allow_other -o IdentityFile=~/.ssh/id_rsa rkici@goto.ucsd.edu:/home/rkici /mnt/goto
#}

#umount_goto ()
#{
	#sudo umount /mnt/droplet
#}

receive_goto ()
{
	rsync -azP \
		--exclude-from '/home/gokhan/.vim/goto-exclude.txt' \
		--exclude 'tools/clang' \
		goto:/home/rkici/llvm/ ~/llvm
}

send_goto ()
{
	# get SafeDispatch from goto, but do alter it when sending
	rsync -azP \
		--exclude-from '/home/gokhan/.vim/goto-exclude.txt' \
		--exclude 'tools/clang' \
		~/llvm/ goto:/home/rkici/llvm
}

wd ()
{
	watch -n 3 "dropbox status"
}

alias sem='cd /home/gokhan/Dropbox/UCSD\ Academic/Quarter\ 2\ -\ Winter\ 2015'

alias topdf='pandoc -V geometry:margin=1in --variable fontsize=12pt'

alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

setclip_nl() {
	head -c -1 | setclip
}

irc () {
	ssh -t goto "TERM=screen-256color tmux attach -t irc"
}
