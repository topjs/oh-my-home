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
    # Set valid options.
    if ! options=$(getopt -u -o AVh -l all,vim:,tmux,zsh,version,help  -- "$@"); then
        # something went wrong, getopt will put out an error message for us
        exit 1
    fi
    set -- $options
}

ArgsCheckCount() {
    local count=$1
    if [ $count = 0 ]; then
        LogError "Not enough arguments passed in."
        ArgsUsage
        exit 1
    else
        LogInfo "Get $count arguments passed in."
    fi
}

ArgsParse() {
    local argcount=$#
    local all=
    local vim_level=
    local tmux=
    local zsh=

    # Check if we have enough args passed in.
    ArgsCheckCount $argcount

    # Init flags before parsing args.
    ArgsInit

    LogInfo "Parsing $argcount arguments..."
    while [ $# -gt 0 ]; do
        case $1 in
            -A|--all) all="y";;
            -V|--version) LogInfo "$VERSION";;
            -h|--help) ArgsUsage;;
            --vim) vim_level="$2"; shift;;
            --tmux) tmux="y";;
            --zsh) zsh="y";;
            (--) shift; break;;
            (*) break;;
        esac
        shift
    done

    if [ "x$all" = "xy" ]; then
        LogInfo "Installing all modules..."
        vim_level="advanced"
        tmux="y"
        zsh="y"
    fi

    if [ "x$vim_level" != "x" ]; then
        LogInfo "Installing Vim..."
        $MODULES_DIR/vim.m/install.sh $vim_level
        LogInfo "Installing Vim...[ok]"
    fi

    if [ "x$tmux" = "xy" ]; then
        LogInfo "Installing Tmux..."
        $MODULES_DIR/tmux.m/install.sh
        LogInfo "Installing Tmux...[ok]"
    fi

    if [ "x$zsh" = "xy" ]; then
        LogInfo "Installing zsh..."
        $MODULES_DIR/zsh.m/install.sh
        LogInfo "Installing zsh...[ok]"
    fi
}
