# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=/home/konrad/bin:/usr/local/texlive/2013/bin/x86_64-linux/:$PATH
export PATH

alias ls='ls --color=auto'
alias f=find
alias g=grep
PS1='\W\$ '
#PS1='[\u@\h \W]\$ '
export GREP_OPTIONS='--color=auto'
export GREP_COLOR=7
