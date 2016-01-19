#!/bin/zsh

set -e

typeset -A files

THIS_DIR=$HOME/.vim/dotfiles

files=( bashrc        $HOME/.bashrc \
        clang-format  $HOME/.clang-format \
        gitconfig     $HOME/.gitconfig \
        gvimrc        $HOME/.gvimrc \
        screenrc      $HOME/.screenrc \
        tmux.conf     $HOME/.tmux.conf \
        vimrc         $HOME/.vimrc \
        Xmodmap       $HOME/Xmodmap \
        Xresources    $HOME/.Xresources \
        zshrc         $HOME/.zshrc \
      )

#compton.conf
#i3_config
#i3status.conf

echo "creating symbolic links for the dotfiles..."

for f in "${(@k)files}"; do
    local SOURCE=$THIS_DIR/$f
    local TARGET=$files[$f]

    local TARGET_DIR=$(dirname $TARGET)
    if [[ ! -d $TARGET_DIR ]]; then
        mkdir -p $TARGET_DIR
    else
        if [[ -f $TARGET && ! -h $TARGET ]]; then
            cp $TARGET $TARGET.old
            echo "backed up $TARGET to $TARGET.old"
        fi
        rm -f $TARGET
    fi

    ln -s $SOURCE $TARGET
done

echo "DONE!"