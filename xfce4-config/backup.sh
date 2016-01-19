#!/bin/zsh

set -e

XFCE_CONF_DIR=$HOME/.config/xfce4
BACKUP_DIR=$HOME/.vim/xfce4-config

typeset -A configs
configs=( terminal/terminalrc                                     terminalrc \
          xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml xfce4-keyboard-shortcuts.xml \
          xfconf/xfce-perchannel-xml/xfce4-panel.xml              xfce4-panel.xml \
          xfconf/xfce-perchannel-xml/xfce4-power-manager.xml      xfce4-power-manager.xml \
          xfconf/xfce-perchannel-xml/xsettings.xml                xsettings.xml \
        )

if [[ $# != 1 ]]; then
    echo "usage: backup.sh (store|load)"
    exit 1
fi

if [[ $1 == "store" ]]; then
    for conf in "${(@k)configs}"; do
        local BACKUP=$BACKUP_DIR/$configs[$conf]
        local CONF=$XFCE_CONF_DIR/$conf
        cp $CONF $BACKUP
    done
elif [[ $1 == "load" ]]; then
    for conf in "${(@k)configs}"; do
        local BACKUP=$BACKUP_DIR/$configs[$conf]
        local CONF=$XFCE_CONF_DIR/$conf
        cp $CONF $CONF.old
        cp $BACKUP $CONF
    done
else
    echo "invalid argument: $1"
    echo "usage: backup.sh (store|load)"
    exit 1
fi
