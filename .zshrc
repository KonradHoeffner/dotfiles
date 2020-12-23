\cd "$(<>/dev/shm/$USER-pwd)"

__cd(){
    \cd "$@"
    pwd | sed "s| |\\\ |g" > /dev/shm/$USER-pwd
}
alias cd=__cd
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
setopt inc_append_history autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# Key bindings for special keys (from https://wiki.archlinux.org/index.php/Zsh#Key_bindings)
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

bindkey  "^[[1;5D"     backward-word
bindkey  "^[[1;5C"    forward-word
# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
# End of key bindings for special keys (from https://wiki.archlinux.org/index.php/Zsh#Key_bindings)

PATH="$PATH:.:~/bin"
export PATH
export EDITOR=vim
export PYTHONPYCACHEPREFIX=~/.pycache
alias ls='ls --color=auto'
alias f=find
alias g=grep
alias firefox=firefox-developer-edition
alias bibtex="bibtex -terse"
unalias pdflatex &> /dev/null # silence error message when not aliased
_pdflatex() { texfot pdflatex -halt-on-error $@ | grep -v hbox | grep -v titlesec | grep -v "scrreprt Warning"}
alias pdflatex=_pdflatex
alias latexmk="latexmk -pdf -halt-on-error"
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
PS1='%c$ '
unset GREP_OPTIONS
alias grep="/usr/bin/grep --color=auto"
export GREP_COLOR=7
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export LANG=en_US.UTF-8
export HISTTIMEFORMAT="%d/%m/%y %T "
SVN_EDITOR=vim
# pwd as title
precmd () { print -Pn "\e]2;%~\a" }
