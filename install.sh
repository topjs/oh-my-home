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

#-------------------- Load utils --------------------

# Load logger.
. "$UTILS_DIR/log.sh"

# Load args for parsing command line options.
. "$UTILS_DIR/args.sh"

# Load checker.
. "$UTILS_DIR/check.sh"

main() {
    # Init options first.
    ArgsInit

    # Check before install.
    Check

    # Parse args.
    ArgsParse $@
}

# Run main function finally to install modules.
main "$@"
