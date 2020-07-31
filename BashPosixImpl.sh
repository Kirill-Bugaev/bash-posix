#!/bin/bash

__bash_posix_mkfifo_in_tmp() {
	local -n path=$1
	path=$(mktemp -u)
	if ! mkfifo "$path"; then 
		return 1
	fi
}; export -f __bash_posix_mkfifo_in_tmp

__bash_posix_get_free_fd() {
	local -n free_fd=$1
	local fd_limit
	fd_limit=$(ulimit -n)
	local used_fds
	mapfile -t used_fds < <(ls -1 /proc/$$/fd)
	for (( i = 3; i < fd_limit; i++ )); do
		if [[ ! ${used_fds[*]} =~ $i ]]; then
			# shellcheck disable=SC2034
			free_fd=$i
			return 0
		fi
	done
	return 1
}; export -f __bash_posix_get_free_fd

__bash_posix_pipe() {
	local -n pipefd=$1
}; export -f __bash_posix_pipe
