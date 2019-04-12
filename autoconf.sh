#!/bin/bash
# This is an autoconfig shell script for configuring
# personal developing environment, including Tmux, Vim.
#
# Note:
#   1. root privilege is needed at first to install required packages.
#   2. Some aliases are set fot tmux in .bash_aliases
#   3. Old config are moved to $HOME/autoconf.backup/

BACKUP_DIR="$HOME/configs.old/"
PWD=`pwd`

echo "=====> Installing required packages ..." 
sudo apt install ack tmux ctags cmake cscope
echo "=====> Installing required packages ...[ok]" 

echo -n "=====> Creating configs.old ..."
if [ ! -d $BACKUP_DIR ]; then
    mkdir $BACKUP_DIR
else
    rm -rf $BACKUP_DIR/*
fi
echo "[ok]"

# Append bash aliases to .bash_aliases
echo -n "=====> Checking .bash_aliases ..."
if [ ! -f "$HOME/.bash_aliases" ]; then
    cp $PWD/bash_aliases $HOME/.bash_aliases
else
    nlines=$(wc -l <$PWD/bash_aliases)
    diff $PWD/bash_aliases <(tail -n $nlines $HOME/.bash_aliases) > /dev/null
    if [ $? -ne 0 ]; then
        cat $PWD/bash_aliases >> $HOME/.bash_aliases
    fi
fi
echo "[ok]"

echo -n "=====> Checking .vimrc ..."
if [ -f $HOME/.vimrc ]; then
    mv $HOME/.vimrc $BACKUP_DIR
fi
cp $PWD/vimrc $HOME/.vimrc
echo "[ok]"

echo -n "=====> Checking .vim/ directory ..."
if [ -f $HOME/.vim/ ]; then
    mkdir $HOME/.vim/
fi
echo -n "[ok]"

echo "=====> Configuring .plugins.vim ..."
if [ -f $HOME/.vim/.plugins.vim ]; then
    rm $HOME/.vim/.plugins.vim
fi
cp $PWD/plugins.vim $HOME/.vim/.plugins.vim
echo "[ok]"

# TODO May add some commands here to install plugins silently
