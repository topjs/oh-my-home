#!/bin/bash
#
# Installation script for Vim config.
#
# Copyright (C) <2019>
# Written by Fang Xiaoliang <fangxlmr@foxmail.com>
#
# This file will install Vim config in one of 3 levels (basic, extended and advanced)
# according to the option that command line specified. The following describe
# these version breifly.
#
# Basic version:
# This version only contains basic config for Vim aiming for basic use, such as
# show line number and enable syntax, etc. You can view basic.vim in this directory
# for more details.
# It is notable that basic.vim would be installed as .vimrc under $HOME directory
# and it will source extended.vim if either extended version or advanced version
# are specified.
#
# Extended version:
# This version extended basic Vim for better user experience, including highlighted
# the current line, enabled hidden option in Vim and handy map for moving bettween
# Vim windows. You can view extended.vim in this directory for more details.
# It is notable that extended.vim would be sourced in .vimrc under $HOME directory
# and extended.vim will source advanced.vim once advanced version are specified.
#
# Advanced version:
# This version is ultimate version of vim for configuring Vim to be an IDE-like editor.
# plugins.vim shell be installed if advanced version is specified, and it contains tons
# of pluings in order to make the most use of features in Vim, leading to the powerful
# functions such as code completion, navigation in project and search-select-replace
# function. You can view plugings.vim in this directory for more details.
# It is notable that plugins.vim would be sourced by extended.vim if it exists.
#
# NOTE:
# This script will be sourced by main install.sh if Vim option is specified. And
# this script will source utils.sh if UTILS_DIR.
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#

MODULE="vim"
AUTHOR="Fang Xiaoliang <fangxlmr@foxmail.com>"
VERSION="0.0.2"

HOME_DIR=$HOME
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$UTILS_DIR/utils.sh"

VIM_DIR="$HOME_DIR/.vim"

FROM_BASIC_FILE="$SCRIPT_DIR/basic.vim"
FROM_EXTENDED_FILE="$SCRIPT_DIR/extended.vim"
FROM_ADVANCED_FILE="$SCRIPT_DIR/plugins.vim"

TO_BASIC_FILE="$HOME_DIR/.vimrc"
TO_EXTENDED_FILE="$VIM_DIR/.extended.vim"
TO_ADVANCED_FILE="$VIM_DIR/.plugins.vim"

function do_install_basic {
    do_cover $FROM_BASIC_FILE $TO_BASIC_FILE
}

function do_install_extended {
    do_cover $FROM_BASIC_FILE $TO_BASIC_FILE
    do_cover $FROM_EXTENDED_FILE $TO_EXTENDED_FILE
}

function do_install_advanced {
    do_cover $FROM_BASIC_FILE $TO_BASIC_FILE
    do_cover $FROM_EXTENDED_FILE $TO_EXTENDED_FILE
    do_cover $FROM_ADVANCED_FILE $TO_ADVANCED_FILE

    echo "[$MODULE] Installing Vundle..."
    if [[ ! -d $VIM_DIR/bundle/Vundle.vim ]]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else
        echo "[$MODULE] Vundle is already installed...[ok]"
    fi
    echo "[$MODULE] Installing Vundle...[ok]"

    echo "[$MODULE] Installing plugins for Vim..."
    echo "This process will take a while, you can take a break..."
    sleep 5
    vim tmpfile +PluginInstall +qall
    echo "[$MODULE] Installing plugins for Vim...[ok]"

    echo "[$MODULE] Compiling stuff of YCM..."
    cd ~/.vim/bundle/YouCompleteMe
    if (./install.py --clang-completer); then
        echo "[$MODULE] Compiling stuff of YCM...[ok]"
    else
        echo "[$MODULE] Something wrong happened when compiling YCM...[ok]"
    fi

    echo "[$MODULE] Compiling stuff of LeaderF..."
    cd ~/.vim/bundle/LeaderF
    if (./install.sh); then
        echo "[$MODULE] Compiling stuff of LeaderF...[ok]"
    else
        echo "[$MODULE] Something wrong happened when compiling LeaderF...[ok]"
    fi
}

function do_install {
    level=$1

    # Check if module exsits beforehand.
    status=$(do_search $MODULE)
    if [[ $status = $level ]]; then
        # Quit if already installed.
        echo "[$MODULE] Vim ($level level) is already installed."

    else
        # Install specified version now.
        case $level in
            "basic")
                echo "[$MODULE] Installing basic config for Vim..."
                do_install_basic
                echo "[$MODULE] Installing basic config for Vim...[ok]";;

            "extended")
                echo "[$MODULE] Installing extended config for Vim..."
                do_install_extended
                echo "[$MODULE] Installing extended config for Vim...[ok]";;

            "advanced")
                echo "[$MODULE] Installing advanced config for Vim..."
                do_install_advanced
                echo "[$MODULE] Installing advanced config for Vim...[ok]";;

            *)
                echo "[$MODULE] [ERROR] No such level config for Vim. Installation exits."
                exit 128;;
        esac

        # Update module info after installation.
        do_replace $MODULE $level
    fi
}

# Now, we do install finally.
do_install "$@"
