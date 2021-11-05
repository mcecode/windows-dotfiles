# Window title
PS1='\[\e]Git-Bash  :  \w\a\]'

# New line
PS1="$PS1"'\n'

# Yellow current working directory base name
PS1="$PS1"'\[\e[33m\]\W'

if [ -z "$WINELOADERNOEXEC" ]; then
	GIT_EXEC_PATH="$(git --exec-path 2> /dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH}/share/git/completion"

	if [ -f "${COMPLETION_PATH}/git-prompt.sh" ]; then
		source "${COMPLETION_PATH}/git-completion.bash"
		source "${COMPLETION_PATH}/git-prompt.sh"

		# Blue git state
		PS1="$PS1"'\[\e[34m\]`__git_ps1`'
	fi
fi

# Reset dollar sign
PS1="$PS1"'\[\e[0m\] $ '
