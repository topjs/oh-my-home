#!/bin/sh
#
# log.sh to define log functions.
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

ArgsUsage() {
Log "./install.sh (OPTION)

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

ArgsInit() {
    # Init option flags.
    all=False
    vim_level=False
    tmux=False
    zsh=False

    # Set valid options.
    if ! options=$(getopt -u -o AVh -l all,vim:,tmux,zsh,version,help  -- "$@"); then
        # something went wrong, getopt will put out an error message for us
        exit 1
    fi
    set -- $options
}

ArgsParse() {
    while [ $# -gt 0 ]; do
        case $1 in
            -A|--all) all=True;;
            -V|--version) LogInfo "$VERSION";;
            -h|--help) ArgsUsage;;
            --vim) vim_level="$2"; shift;;
            --tmux) tmux=True;;
            --zsh) zsh=True;;
            (--) shift; break;;
            (*) break;;
        esac
        shift
    done

    if [[ $all = "True" ]]; then
        LogInfo "Installing all modules..."
        vim_level="advanced"
        tmux=True
        zsh=True
    fi

    if [[ $vim_level != "False" ]]; then
        LogInfo "Installing Vim..."
        $MODULES_DIR/vim.m/install.sh $vim_level
        LogInfo "Installing Vim...[ok]"
    fi

    if [[ $tmux = "True" ]]; then
        LogInfo "Installing Tmux..."
        $MODULES_DIR/tmux.m/install.sh
        LogInfo "Installing Tmux...[ok]"
    fi

    if [[ $zsh = "True" ]]; then
        LogInfo "Installing zsh..."
        $MODULES_DIR/zsh.m/install.sh
        LogInfo "Installing zsh...[ok]"
    fi
}
