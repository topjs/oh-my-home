#!/bin/bash
# This script uninstall relavant configs that install.sh has done.

PWD=`pwd`
BACKUP_DIR="$PWD/configs.old/"

echo -n "=====> Checking configs.old ..."
if [[ ! -d $BACKUP_DIR ]]; then
    echo "No old configs. Failed to uninstall."
    exit -1
fi
echo "[ok]"

echo -n "=====> Uninstalling .bash_aliases ..."
if [[ -f "$HOME/.bash_aliases" ]]; then
    cp $BACKUP_DIR/.bash_aliases $HOME/.bash_aliases
fi
echo "[ok]"

echo -n "=====> Uninstalling .tmux.conf ..."
if [[ -f $HOME/.tmux.conf ]]; then
    cp $BACKUP_DIR/.tmux.conf $HOME/.tmux.conf
fi
echo "[ok]"

echo -n "=====> Uninstalling .vimrc ..."
if [[ -f $HOME/.vimrc ]]; then
    cp $BACKUP_DIR/.vimrc $HOME/.vimrc
fi
echo "[ok]"

echo -n "=====> Uninstalling .plugins.vim ..."
if [[ -f $BACKUP_DIR/.vim/.plugins.vim ]]; then
    if [[ ! -d $HOME/.vim/ ]]; then
        mkdir $HOME/.vim/
    fi
    cp $BACKUP_DIR/.plugins.vim $HOME/.vim/.plugins.vim
fi
echo "[ok]"

echo "=====> Uninstall successfully."
