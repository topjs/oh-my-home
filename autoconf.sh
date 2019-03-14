#!/bin/sh

CURRENT_DIR=`pwd`
BACKUP_DIR="$HOME/backup"
VIMRC="$HOME/.vimrc"
PLUGINS_DIR="$HOME/.vim/"
PLUGINS_VIM="$HOME/.vim/.plugins.vim"

# Install required libs
sudo apt install ack tmux ctags cmake cscope

echo "Creating backup"
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir $BACKUP_DIR
else
    rm $BACKUP_DIR/*
fi

echo "Checking .vimrc"
if [ -f "VIMRC"]; then
    mv VIMRC $BACKUP_DIR
else
    cp CURRENT_DIR/.vimrc $HOME
fi

echo "Checking .bash_aliases"
if [ ! -f "$HOME/.bash_aliases" ]; then
    touch $HOME/.bash_aliases
else
    # todo  append bash aliases to .bash_aliases
    # alias tmuxkill="tmux kill-session -t"
    # alias tmuxattach="tmux a -t"
    # alias tmuxnew="tmux new -s"
    # alias tmuxls="tmux ls"
fi
