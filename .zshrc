# Libraries
autoload -Uz compinit && compinit


# Prompt
autoload -Uz vcs_info
autoload -Uz colors; colors
setopt prompt_subst
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{\033[38;5;12m%}git:(%{\033[m%}%{${fg[red]}%}${vcs_info_msg_0_}%{${reset_color}%}%{\033[38;5;12m%})%{\033[m%} "
  fi
}
PROMPT='%F{yellow}λ%f %F{cyan}%1~%f $(vcs_info_wrapper)'
zstyle ':vcs_info:git:*' formats '%b'


# Aliases
alias ls="ls -G"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Key Bindings
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line


# Options
# http://zsh.sourceforge.net/Doc/Release/Options.html

#-----------------------------
# Changing Directories
#-----------------------------


#-----------------------------
# Completion
#-----------------------------

# When the current word has a glob pattern, do not insert all the words
# resulting from the expansion but generate matches as for completion and cycle
# through them like MENU_COMPLETE.
setopt GLOB_COMPLETE


#-----------------------------
# Expansion and Globbing
#-----------------------------


#-----------------------------
# History
#-----------------------------
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

# If this is set, zsh sessions will append their history list to the history
# file, rather than replace it.
setopt APPEND_HISTORY

# Save each command’s beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file.
setopt EXTENDED_HISTORY

# Do not enter command lines into the history list if they are duplicates of
# the previous event.
setopt HIST_IGNORE_DUPS

# Remove superfluous blanks from each command line being added to the history
# list.
setopt HIST_REDUCE_BLANKS

# This option is a variant of INC_APPEND_HISTORY in which, where possible, the
# history entry is written out to the file after the command is finished, so
# that the time taken by the command is recorded correctly in the history file
# in EXTENDED_HISTORY format.
setopt INC_APPEND_HISTORY_TIME


#-----------------------------
# Initialisation
#-----------------------------


#-----------------------------
# Input/Output
#-----------------------------
zstyle ':completion:*' menu select

# Try to correct the spelling of commands.
setopt CORRECT

# Try to correct the spelling of all arguments in a line.
setopt CORRECT_ALL

# Print the exit value of programs with non-zero exit status.
setopt PRINT_EXIT_VALUE


#-----------------------------
# Job Control
#-----------------------------


#-----------------------------
# Prompting
#-----------------------------


#-----------------------------
# Scripts and Functions
#-----------------------------


#-----------------------------
# Shell Emulation
#-----------------------------


#-----------------------------
# Shell State
#-----------------------------


#-----------------------------
# Zle
#-----------------------------

# Beep on error in ZLE.
unsetopt BEEP


#-----------------------------
# Variables and Completion
#-----------------------------

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# vim
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# go
if [ -x "$(command -v go)" ]; then
  export GOPATH=$(go env GOPATH)
  export PATH=$PATH:$GOPATH/bin
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# k8s
if [ -x "$(command -v kubectl)" ]; then
  source <(kubectl completion zsh)
  alias k=kubectl
  complete -F __start_kubectl k
fi

# terraform
if [ -x "$(command -v terraform)" ]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C $(which terraform) terraform
fi


#-----------------------------
# Other
#-----------------------------
# Docker: https://docs.docker.com/docker-for-mac/#zsh

# Add help command
function help() {
    bash -c "help $@"
}

