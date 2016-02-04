#!/bin/zsh

set -e

typeset -A files

THIS_DIR=$HOME/.vim/dotfiles

files=( bashrc           $HOME/.bashrc \
        clang-format     $HOME/.clang-format \
        gitconfig        $HOME/.gitconfig \
        gvimrc           $HOME/.gvimrc \
        screenrc         $HOME/.screenrc \
        tmux.conf        $HOME/.tmux.conf \
        vimrc            $HOME/.vimrc \
        Xmodmap          $HOME/.Xmodmap \
        Xresources       $HOME/.Xresources \
        zshrc            $HOME/.zshrc \
        fonts_local.conf $HOME/.config/fontconfig/fonts.conf \
        compton.conf     $HOME/.config/compton.conf \
        mimeapps.list    $HOME/.config/mimeapps.list
      )

#i3_config
#i3status.conf

echo "creating symbolic links for the dotfiles..."

file_date() {
    stat --format=%Y $1
}

for f in "${(@k)files}"; do
    local SOURCE=$THIS_DIR/$f
    local TARGET=$files[$f]

    local TARGET_DIR=$(dirname $TARGET)
    if [[ ! -d $TARGET_DIR ]]; then
        mkdir -p $TARGET_DIR
    else
        if [[ -f $TARGET && ! -h $TARGET ]]; then
            cp $TARGET $TARGET.old

            if [[ $(file_date $TARGET) -gt $(file_date $SOURCE) ]]; then
                echo "Target $TARGET is newer, copying it to $SOURCE"
                cp $TARGET $SOURCE
            fi

            echo "backed up $TARGET to $TARGET.old"
            rm -f $TARGET
        fi
    fi


    if [[ ! -f $TARGET ]]; then
        ln -s $SOURCE $TARGET
    else
        echo "skipping $f"
    fi
done

echo "DONE!"
