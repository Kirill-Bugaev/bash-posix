#!/bin/bash

__bash_posix_script_dir=$(dirname "${BASH_SOURCE[0]}")
# shellcheck source=./BashPosixImpl.sh
source "$__bash_posix_script_dir/BashPosixImpl.sh"

declare -A BashPosix
export BashPosix

#
# Unset all elements of specified array
# @param $1 array
##
BashPosix["clearArray"]="__bugaev_helper_clear_array"
