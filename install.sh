#!/bin/bash
# This is an autoconfig shell script for configuring personal developing
# environment, including Tmux, Vim.
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

#-------------------- Load config --------------------

# Top dir of the whole repo.
TOP_DIR="$(pwd)"

# Load default config
. "$TOP_DIR/config/default.sh"

usage() {
echo "./install.sh (OPTION)

DESCRIPTION
    Install configs for some software to provide a better user experience.

    Mandatory arguments to long options are mandatory for short options too.

    -A, --all
        install all modules

    --vim=LEVEL
        install specified LEVEL config for Vim where LEVEL should be one of \"basic\", \"extened\" and \"advanced\"

    --tmux
        install config for Tmux

    -h, --help
        display this help and exit

    -V, --version
        output version information and exit"
}

prepare() {
    mkdir $BACKUP_DIR 1>/dev/null 2>&1
    mkdir $CACHE_DIR 1>/dev/null 2>&1
}

main() {
    # Option flags.
    all=False
    vim_level=False
    tmux=False
    zsh=False

    # Prepare before installation.
    prepare()

    # Set valid command line options.
    if ! options=$(getopt -u -o AVh -l all,vim:,tmux,zsh,version,help  -- "$@"); then
        # something went wrong, getopt will put out an error message for us
        exit 1
    fi
    set -- $options

    # Parsing arguments passed by command line.
    while [ $# -gt 0 ]; do
        case $1 in
            -A|--all) all=True;;
            -V|--version) echo "$VERSION";;
            -h|--help) usage;;
            --vim) vim_level="$2"; shift;;
            --tmux) tmux=True;;
            --zsh) zsh=True;;
            (--) shift; break;;
            (*) break;;
        esac
        shift
    done

    if [[ $all = "True" ]]; then
        echo "[$MODULE] Installing all modules..."
        vim_level="advanced"
        tmux=True
        zsh=True
    fi

    if [[ $vim_level != "False" ]]; then
        echo "[$MODULE] Installing Vim..."
        $MODULES_DIR/vim.m/install.sh $vim_level
        echo "[$MODULE] Installing Vim...[ok]"
    fi

    if [[ $tmux = "True" ]]; then
        echo "[$MODULE] Installing Tmux..."
        $MODULES_DIR/tmux.m/install.sh
        echo "[$MODULE] Installing Tmux...[ok]"
    fi

    if [[ $zsh = "True" ]]; then
        echo "[$MODULE] Installing zsh..."
        $MODULES_DIR/zsh.m/install.sh
        echo "[$MODULE] Installing zsh...[ok]"
    fi
}

# Run main function finally to install modules.
main "$@"
