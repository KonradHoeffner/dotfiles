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

PATH="$PATH:.:/home/konrad/bin:/home/konrad/.local/bin"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
PATH="$PATH:$GEM_HOME/bin"
export PATH
export EDITOR=vim
export SVN_EDITOR=vim
export PYTHONPYCACHEPREFIX=~/.pycache
export DOCKER_BUILDKIT=1
alias ls='ls --color=auto'
alias f=find
alias g=grep
alias bibtex="bibtex -terse"
unalias pdflatex &> /dev/null # silence error message when not aliased
unalias latexmk &> /dev/null # silence error message when not aliased
alias pdflatex='texfot pdflatex -interaction=nonstopmode -halt-on-error -file-line-error'
alias latexmk="latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error"
# system tool replacements
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vimdiff='nvim -d'
if type firefox-developer-edition > /dev/null 2>&1; then
  alias firefox='firefox-developer-edition'
fi
if type exa > /dev/null 2>&1; then
  alias ls='exa'
fi
if type bat > /dev/null 2>&1; then
  alias cat='bat'
fi
# workaround for GNOME keyring parallel bug, see https://gitlab.gnome.org/GNOME/gnome-keyring/-/issues/102
alias multipull="git -C /home/konrad/projekte/hito/ontology pull origin master && find . -maxdepth 5 -name .git -type d | rev | cut -c 6- | rev | parallel -j64 'echo -n {}... && git -C {} pull | grep -v \"up to date\"'"
alias multipull-serial="find . -maxdepth 5 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} sh -c 'echo -n {}... && git -C {} pull'"
alias multipush="find . -maxdepth 5 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} sh -c 'echo -n {}... && git -C {} push'"
PS1='%c$ '
unset GREP_OPTIONS
alias grep="/usr/bin/grep --color=auto"
export GREP_COLORS='mt=7'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export LANG=en_US.UTF-8
export HISTTIMEFORMAT="%d/%m/%y %T "
# pwd as title
precmd () { print -Pn "\e]2;%~\a" }
# branch on the right if it isn't main or master
my_precmd() {
  vcs_info
  local br=$vcs_info_msg_0_
  [[ $br == 'main' || $br == 'master' ]] && br=''
  psvar[1]="$br"
}
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b'
autoload -Uz add-zsh-hook
add-zsh-hook precmd my_precmd
RPROMPT='%1v'
