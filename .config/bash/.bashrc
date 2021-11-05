#==================================================
# Variables
#==================================================

# Bash history
HISTCONTROL="ignoreboth:erasedups"
HISTTIMEFORMAT="%F %T "

# Git
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="auto verbose"

#==================================================
# Aliases
#==================================================

# Pretty list
alias pls="ls -AF --group-directories-first --color=always"
alias dotfiles="git --git-dir=\"$HOME/.dotfiles\" --work-tree=\"$HOME\""

#==================================================
# Functions
#==================================================

# Make directory change directory
function mkdcd() {
  mkdir "$1" && cd "$1"
}

# Remove current working directory
function rmcwd() {
  local pwd="$PWD"
  cd .. && rm -rf "$pwd"
}
