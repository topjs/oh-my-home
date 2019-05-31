#!/bin/bash
# This script uninstall relavant configs that install.sh has done.
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
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

AUTHOR="Fang Xiaoliang <fangxlmr@foxmail.com>"
# Each module has a module name for logging.
MODULE="MAIN"
VERSION="0.0.2"

# Each script has it's own absolute script directory.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# The following varialbles would be refered in subscripts.
# Directory that all modules located in.
export MODULES_DIR="$SCRIPT_DIR/modules"
# User home directory.
export HOME_DIR=$HOME
# Backup directory to store old configs.
export BACKUP_DIR="$SCRIPT_DIR/configs.old"
# Some util functions.
export UTILS_DIR="$SCRIPT_DIR/utils"

function usage {
echo "./uninstall.sh (OPTION)

DESCRIPTION
    Uninstall configs that install.sh has installed.

    Mandatory arguments to long options are mandatory for short options too.

    -A, --all
        uninstall all modules

    --vim
        uninstall Vim module

    --tmux
        uninstall Tmux module

    -h, --help
        display this help and exit

    -V, --version
        output version information and exit"
}

function main {
    # Uninstall flags.
    all=False
    vim=False
    tmux=False
    zsh=False

    # Set command line options.
    if ! options=$(getopt -u -o AVh -l all,vim,tmux,zsh,version,help -n "[ERROR]" -- "$@"); then
        # something went wrong, getopt will put out an error message for us
        exit 1
    fi
    set -- $options

    # Parsing command line.
    while [ $# -gt 0 ]; do
        case $1 in
            -A|--all) all=True;;
            -V|--version) echo "$VERSION";;
            -h|--help) usage;;
            --vim) vim=True;;
            --tmux) tmux=True;;
            --zsh) zsh=True;;
            (--) shift; break;;
            (*) break;;
        esac
        shift
    done

    if [[ $all = "True" ]]; then
        echo "[$MODULE] Uninstalling all modules..."
        vim=True
        tmux=True
        zsh=True
    fi

    if [[ $vim = "True" ]]; then
        echo "[$MODULE] Uninstalling Vim..."
        $MODULES_DIR/vim.m/uninstall.sh
        echo "[$MODULE] Uninstalling Vim...[ok]"
    fi

    if [[ $tmux = "True" ]]; then
        echo "[$MODULE] Uninstalling Tmux..."
        $MODULES_DIR/tmux.m/uninstall.sh
        echo "[$MODULE] Uninstalling Tmux...[ok]"
    fi

    if [[ $zsh = "True" ]]; then
        echo "[$MODULE] Uninstalling zsh..."
        $MODULES_DIR/zsh.m/uninstall.sh
        echo "[$MODULE] Uninstalling zsh...[ok]"
    fi
}

# Run main function finally to uninstall modules.
main "$@"
