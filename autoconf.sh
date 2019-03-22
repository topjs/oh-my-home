#!/bin/sh

BACKUP_DIR="$HOME/autoconf.backup"
PWD=`pwd`

echo "=====> Installing required packages" 
sudo apt install ack tmux ctags cmake cscope

echo "=====> Creating backup"
if [ ! -d $BACKUP_DIR ]; then
    mkdir $BACKUP_DIR
else
    rm -rf $BACKUP_DIR/*
fi

# Append bash aliases to .bash_aliases
# echo "=====> Appending tmux alias to .bash_aliases"
# echo ' # tmux config
# alias tmuxkill="tmux kill-session -t"
# alias tmuxattach="tmux a -t"
# alias tmuxnew="tmux new -s"
# alias tmuxls="tmux ls" ' >> $HOME/.bash_aliases

echo "=====> Checking .bash_aliases"
if [ ! -f "$HOME/.bash_aliases" ]; then
    touch $HOME/.bash_aliases
fi

echo "=====> Checking .vimrc"
if [ -f $HOME/.vimrc ]; then
    mv $HOME/.vimrc $BACKUP_DIR
fi
cp $PWD/.vimrc $HOME

echo "=====> Checking .vim directory"
if [ -f $HOME/.vim/ ]; then
    mkdir $HOME/.vimrc
fi

echo "=====> Config .plugin.vim"
if [ -f $HOME/.vim/.plugins.vim ]; then
    rm $HOME/.vim/.plugins.vim
fi
cp $PWD/.plugins.vim $HOME/.vim/

# TODO May add some command here to install plugins silently
