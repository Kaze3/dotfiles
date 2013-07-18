#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Machine-specific settings go in here
[[ -f ~/.bashrc_custom ]] && . ~/.bashrc_custom

# Custom Prompt
PS1='\[\e[0;32m\]\u\[\e[0;32m\]@\[\e[0;32m\]\h: \[\e[0;33m\]\w \[\e[0;32m\]\n\$ \[\e[0;37m\]'

# Aliases
alias ls='ls --color=auto -hF'
alias rmr='rm -R'
alias wget='wget --content-disposition'
alias search-running='ps ax | grep'
alias emacs='emacs -nw'
