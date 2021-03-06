#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set terminal to display 256 colours
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
fi

# Machine-specific settings go in here
[[ -f ~/.bashrc_custom ]] && . ~/.bashrc_custom

# Set flags
isArch=false
[[ -f /etc/arch-release ]] && isArch=true

isRoot=false
[[ $UID -eq 0 ]] && isRoot=true

# Directory Colours
[[ -f ~/.dir_colors ]] && eval `dircolors ~/.dir_colors`

BLACK='\[033[0;30m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE="\[\033[0;34m\]"
MAGENTA='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'
BBLACK='\[033[1;30m\]'
BRED='\[\033[1;31m\]'
BGREEN='\[\033[1;32m\]'
BYELLOW='\[\033[1;33m\]'
BBLUE="\[\033[1;34m\]"
BMAGENTA='\[\033[1;35m\]'
BCYAN='\[\033[1;36m\]'
BWHITE='\[\033[1;37m\]'
RESET='\[\033[0m\]'

# Custom Prompt
PS1="$BBLUE\u$BGREEN@$BGREEN\h$WHITE: $YELLOW\w$RESET\n$WHITE\$ $RESET"

# Aliases
alias ls='ls --color=auto -hFN --group-directories-first'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias startd='sudo systemctl start'
alias stopd='sudo systemctl stop'
alias restartd='sudo systemctl restart'
alias statusd='systemctl status'
alias enabled='sudo systemctl enable'
alias disabled='sudo systemctl disable'

alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'

# Make parent dirs
alias mkdir='mkdir -pv'

alias rmr='rm -R'
alias searchrunning='ps ax | grep'
alias ec='emacsclient -c'
alias et='emacsclient -t'

alias list-filesizes='du -d 1 -h -a | sort -h'

alias killprocess='sudo kill -9'

# Git
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias ga='git add'
alias gaa='git add -A'
alias gd='git diff'

alias motd='/etc/profile.d/motd.sh'

# If we're on Arch...
if $isArch; then
  # If we're not root...
  if ! $isRoot; then
    alias pacman='sudo pacman'
  fi

  alias update='pacman -Syu'
  alias install='pacman -S'
  alias remove='pacman -R'
  alias removedeps='pacman -Rs'
fi

# Environment Variables
export EDITOR='emacsclient -t'
export VISUAL='emacsclient -c -a emacs'

# Autocomplete sudo commands
complete -cf sudo
