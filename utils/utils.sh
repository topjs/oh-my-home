#!/bin/bash
#
# Utils (helper functions) for other functions.
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


# Follwing two functions aim to backup old config and overwrite/append new config.

# This function will bakup the old config and copy our new config to overwrite it.
# It should be called in form of `do_cover <src> <dest>` where <src> is source
# file and <dest> is destination file. If the <dest> doesn't exist, it will create
# all necessary directory to hold <src>.
function do_cover {
    src=$1
    dest=$2

    if [[ ! -s $dest ]]; then
        mkdir -p `dirname $dest` && cp $src $dest
    else
        diff $src $dest >/dev/null
        if [[ $? -ne 0 ]]; then
            mv $dest $BACKUP_DIR
            cp $src $dest
        fi
    fi
}

# This function will backup the old config and append extended config at the end of
# old file.
# It should be called in form of `do_cover <src> <dest>` where <src> is source
# file and <dest> is destination file. If the <dest> doesn't exist, it will create
# all necessary directory to hold <src>.
function do_append {
    src=$1
    dest=$2

    if [[ ! -s $dest ]]; then
        mkdir -p `dirname $dest` && cp $src $dest
    else
        nlines=$(wc -l < $src)
        diff $src <(tail -n $nlines $dest) >/dev/null
        if [[ $? -ne 0 ]]; then
            cp $dest $BACKUP_DIR
            cat $src >> $dest
        fi
    fi
}


# Following two functions aim at searching current status of the module
# and update module's status from old to new.

# This function searchs status of the module in modules.info.
# It should be called in form of `do_search <module_name>` where <module_name>
# should be replaced with your module name.
function do_search {
    # Target module
    module_name=$1

    # Find module status in module.info file.
    status="$(grep -irn $module_name $MODULES_DIR/modules.info | cut -d "=" -f2)"

    # Return status string
    echo $status
}

# This function set status of the module to the new one in modules.info.
# It should be called in form of `do_replace <module_name> <new_status>`
# where all arguments should be replaced with yours.
function do_replace {
    # Target module
    module_name=$1
    new_status=$2

    # Get old status of the module from modules.info.
    old_status=$(do_search $module_name)

    # Update $module_name from $old_status to $new_status in modules.info.
    find $MODULES_DIR/modules.info -type f -print0 | xargs -0 sed -i "s/"$module_name=$old_status"/"$module_name=$new_status"/g"
}

