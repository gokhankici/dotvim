# Welcome to my VIM configuration

I tried to maintain a simple vim environment with some plugins like NerdTree, Fugitive, CtrlP etc. and the [skittles_berry](https://github.com/shawncplus/skittles_berry) theme using vundle. Also xterm and screen supports are added.

# Installation:

## Fetch the repositories

    git clone https://github.com/gokhankici/dotvim.git ~/.vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

## Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    ln -s ~/.vim/tmux.conf ~/.tmux.conf
    ln -s ~/.vim/Xresources ~/.Xresources
    ln -s ~/.vim/screenrc ~/.screenrc

## Load Configurations

	tmux source-file ~/.tmux.conf
	xrdb ~/.Xresources

	At last, start vim and run the command ":BundleInstall". When installation is complete, restart vim.
