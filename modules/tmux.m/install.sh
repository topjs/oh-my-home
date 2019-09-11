#!/bin/bash
#
# Installation script for Tmux config.
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

MODULE="tmux"
AUTHOR="Fang Xiaoliang <fangxlmr@foxmail.com>"
VERSION="0.0.2"

HOME_DIR=$HOME
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$UTILS_DIR/utils.sh"

TMUX_DIR="$HOME_DIR"

FROM_TMUX_FILE="$SCRIPT_DIR/tmux.conf"
TO_TMUX_FILE="$TMUX_DIR/.tmux.conf"

do_install() {
    # Check if module exsits beforehand.
    status=$(do_search $MODULE)
    if [[ $status != "0" ]]; then
        # Quit if already installed.
        echo "[$MODULE] Tmux is already installed."

    else
        # Otherwise install it now.
        do_append $FROM_TMUX_FILE $TO_TMUX_FILE

        # Update module info after installation.
        do_replace $MODULE "1"
    fi
}

# Now, we do install finally.
do_install "$@"
