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

# Solarized Directory Colours
[[ -f ~/.dir_colors ]] && eval `dircolors ~/.dir_colors`

RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE="\[\033[0;34m\]"
MAGENTA='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'
RESET='\[\033[0m\]'

# Custom Prompt
PS1="$BLUE\u$GREEN@$GREEN\h: $YELLOW\w$RESET\n$GREEN\$ $RESET"

# Aliases
alias ls='ls --color=auto -hF'
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

alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'

# Make parent dirs
alias mkdir='mkdir -pv'

alias rmr='rm -R'
alias searchrunning='ps ax | grep'
#alias emacs='TERM=xterm-16color emacs -nw'
#alias semacs='TERM=xterm-16color sudo -e'

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

# If we're on Arch...
if $isArch; then
  # If we're not root...
  if ! $isRoot; then
    alias pacman='sudo pacman'
    #alias packer='sudo packer'
  fi

  alias update='pacman -Syu'
  alias install='pacman -S'
  alias remove='pacman -R'
  alias removedeps='pacman -Rs'

  alias updateaur='packer -Syu --noedit'
  alias installaur='packer -S --noedit'
fi

# Environment Variables
export EDITOR='emacs -nw'

# Autocomplete sudo commands
complete -cf sudo
