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

# Custom Prompt
PS1='\[\e[0;32m\]\u\[\e[0;34m\]@\[\e[0;34m\]\h: \[\e[0;33m\]\w \[\e[0;34m\]\n\$ \[\e[0m\]'

# Aliases
alias ls='ls --color=auto -hF'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Make parent dirs
alias mkdir='mkdir -pv'

alias rmr='rm -R'
alias searchrunning='ps ax | grep'
alias emacs='TERM=xterm-16color emacs -nw'

# If we're on Arch...
if $isArch; then
  # If we're not root...
  if ! $isRoot; then
    alias pacman='sudo pacman'
    alias packer='sudo packer'
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
