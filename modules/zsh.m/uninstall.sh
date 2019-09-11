#!/bin/bash
#
# Uninstallation script for Tmux config.
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

MODULE="zsh"
AUTHOR="Fang Xiaoliang <fangxlmr@foxmail.com>"
VERSION="0.0.2"

HOME_DIR=$HOME
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$UTILS_DIR/utils.sh"

ZSH_DIR="$HOME_DIR"

FROM_ZSHRC_FILE="$SCRIPT_DIR/zshrc"
TO_ZSHRC_FILE="$ZSH_DIR/.zshrc"

do_uninstall() {
    # Check if module has been installed beforehand.
    status=$(do_search $MODULE)
    if [[ $status = "0" ]]; then
        # Quit if already removed or not installed yet.
        echo "[$MODULE] zsh is not installed."

    else
        # Otherwise remove it now by old config or just remove the file.
        if [[ -f $BACKUP_DIR/.zshrc ]]; then
            cp $BACKUP_DIR/.zshrc $TO_ZSHRC_FILE 2>/dev/null
        else
            rm $TO_ZSHRC_FILE
        fi

        # Update module info after uninstallation.
        do_replace $MODULE "0"
    fi
}

# Now, we do uninstall finally.
do_uninstall "$@"
