# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=~/bin:$PATH
export PATH

alias ls='ls --color=auto'
alias f=find
alias g=grep
PS1='\W\$ '
#PS1='[\u@\h \W]\$ '
unset GREP_OPTIONS
alias grep="/usr/bin/grep --color=auto"
export GREP_COLORS='mt=7'
