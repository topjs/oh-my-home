#!/bin/bash
#
# Uninstallation script for Vim config.
#
# Copyright (C) <2019>
# Written by Fang Xiaoliang <fangxlmr@foxmail.com>
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

function do_uninstall_basic {
    if [[ -f $BACKUP_DIR/.vimrc ]]; then
        cp $BACKUP_DIR/.vimrc $HOME_DIR 2>/dev/null
    else
        rm $TO_BASIC_FILE
    fi
}

function do_uninstall_extended {
    do_uninstall_basic
    rm $TO_EXTENDED_FILE
}

function do_uninstall_advanced {
    do_uninstall_extended
    rm $TO_ADVANCED_FILE
}

function do_uninstall {
    # Check if module exsits beforehand.
    status=$(do_search $MODULE)
    if [[ $status = "0" ]]; then
        # Quit if already removed.
        echo "[$MODULE] Vim is not installed."

    else
        # Remove it if it's installed.
        if [[ $status = "basic" ]]; then
            do_uninstall_basic
        elif [[ $status = "extended" ]]; then
            do_uninstall_extended
        elif [[ $status = "advanced" ]]; then
            do_uninstall_advanced

         do_replace $MODULE "0"
        fi
    fi
}

# Now, we uninstall vim.
do_uninstall "$@"
