#!/bin/bash
# This is an autoconfig shell script for configuring
# personal developing environment, including Tmux, Vim.
#
# Note:
#   1. root privilege is needed at first to install required packages.
#   2. Some aliases are set fot tmux in .bash_aliases
#   3. Old config are moved to $HOME/autoconf.backup/

PWD=`pwd`
BACKUP_DIR="$PWD/configs.old/"

echo "=====> Installing required packages ..." 
sudo apt-get install vim ack tmux ctags cmake cscope\
    build-essential cmake python3-dev
echo "=====> Installing required packages ...[ok]" 

echo -n "=====> Creating configs.old ..."
if [[ ! -d $BACKUP_DIR ]]; then
    mkdir $BACKUP_DIR
else
    rm -rf $BACKUP_DIR/*
fi
echo "[ok]"

# Append bash aliases to .bash_aliases
echo -n "=====> Checking .bash_aliases ..."
if [[ ! -f "$HOME/.bash_aliases" ]]; then
    cp $PWD/bash_aliases $HOME/.bash_aliases
else
    nlines=$(wc -l <$PWD/bash_aliases)
    diff $PWD/bash_aliases <(tail -n $nlines $HOME/.bash_aliases) > /dev/null
    if [[ $? -ne 0 ]]; then
        cat $PWD/bash_aliases >> $HOME/.bash_aliases
    fi
fi
echo "[ok]"

echo -n "=====> Checking .vimrc ..."
if [[ -f $HOME/.vimrc ]]; then
    diff $HOME/.vimrc $PWD/vimrc
    if [[ $? -ne 0 ]]; then
        mv $HOME/.vimrc $BACKUP_DIR
        cp $PWD/vimrc $HOME/.vimrc
    # else
        # Do nothing
    fi
else
    cp $PWD/vimrc $HOME/.vimrc
fi
echo "[ok]"

echo -n "=====> Checking .vim/ directory ..."
if [[ ! -d $HOME/.vim/ ]]; then
    mkdir $HOME/.vim/
fi
echo "[ok]"

echo -n "=====> Configuring .plugins.vim ..."
if [[ -f $HOME/.vim/.plugins.vim ]]; then
    diff $HOME/.vim/.plugins.vim $PWD/plugins.vim
    if [[ $? -ne 0 ]]; then
        mv $HOME/.plugins.vim $BACKUP_DIR
        cp $PWD/plugins.vim $HOME/.vim/.plugins.vim
    # else
        # Do nothing
    fi
else
    cp $PWD/plugins.vim $HOME/.vim/.plugins.vim
fi
echo "[ok]"

echo "=====> Installing Vundle ..."
if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "=====> Installing Vundle ...[ok]"
else
    echo "=====> Vundle is already installed ...[ok]"
fi

echo "=====> Installing plugins for Vim ..."
echo "This process will take a while, you can take a break ..."
sleep 5
vim tmpfile +PluginInstall +qall
echo "=====> Installing plugins for Vim ...[ok]"

echo "=====> Compiling stuff for YCM and Leaderf ..."
echo "=====> [1] Compiling stuff for YCM ..."
cd ~/.vim/bundle/YouCompleteMe
if (./install.py --clang-completer); then
    echo "=====> [1] Compiling stuff for YCM ...[ok]"
else
    echo "=====> [1] Something wrong happened when compiling YCM ...[ok]"
fi

echo "=====> [2] Compiling stuff for LeaderF ..."
cd ~/.vim/bundle/LeaderF
if (./install.sh); then
    echo "=====> [2] Compiling stuff for LeaderF ...[ok]"
else
    echo "=====> [2] Something wrong happened when compiling LeaderF ...[ok]"
fi
echo "=====> Compiling stuff for YCM and Leaderf ...[ok]"

echo "=====> Finish configuring you env. Enjoy! :-)"
