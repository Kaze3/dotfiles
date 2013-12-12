#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Machine-specific settings go in here
[[ -f ~/.bashrc_custom ]] && . ~/.bashrc_custom

# Set flags
isArch=false
[[ -f /etc/arch-release ]] && isArch=true

isRoot=false
[[ $UID -eq 0 ]] && isRoot=true

# Custom Prompt
PS1='\[\e[0;32m\]\u\[\e[0;32m\]@\[\e[0;32m\]\h: \[\e[0;33m\]\w \[\e[0;32m\]\n\$ \[\e[0;37m\]'

# Aliases
alias ls='ls --color=auto -hF'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Make parent dirs
alias mkdir='mkdir -pv'

alias rmr='rm -R'
alias searchrunning='ps ax | grep'
alias emacs='emacs -nw'

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
