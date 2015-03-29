###############################################################################
# zsh-specific 
###############################################################################

# Set up history
export HISTFILE=~/.zsh_history
# This lets us share ~/.zsh_history between different zsh instances
setopt INC_APPEND_HISTORY
export HISTSIZE=50000

# Completion :)
zmodload zsh/complist
autoload -U compinit && compinit

_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1	# Because we didn't really complete anything
}

zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yesxport SAVEHIST=50000

eval `dircolors -b`

zstyle ':completion:*' menu select

###############################################################################
# Aliases 
###############################################################################

alias cube='ssh scott@cube.netsoc.tcd.ie'
alias spoon='ssh scott@spoon.netsoc.tcd.ie'
alias cubex='ssh -X scott@cube.netsoc.tcd.ie'
alias spoonx='ssh -X scott@spoon.netsoc.tcd.ie'

alias ls="ls -F"
alias vi=vim
alias l=ls
alias ll="ls -lh"
alias grep='grep --colour'
alias gitlog='git log --pretty=format:"%h -- %cr -- %an (%ae) -- %s"'

alias get="wget -r -c -np --no-check-certificate --user=`cat ~/.suser` --password=`cat ~/.spasswd`"

# This is for when I'm sshing from my phone...
alias tmyx=tmux
alias tmuy=tmux

# rxvt-unicode sometimes messes up screen/tmux, and this fixes it
if echo $TERM | grep "rxvt-unicode-256color" > /dev/null; then
	export TERM=xterm
fi

###############################################################################
# Prompts
###############################################################################

PROMPT2="%F{[%d]}%_>"
PROMPT="%n@%m%~:> "
RPROMPT='[%*]'

if [[ -f ~/.todo ]] ; then
    cat ~/.todo;
fi


# translate ja to en
function translate () {
    local FROM=$1
    local TO=$2
    echo $0 $1
    local URL="$(echo "$3" | perl -MURI::Escape -ne 'chomp;print uri_escape($_)')"
    curl -s -A "Mozilla" "http://translate.google.com/translate_a/t?client=t&ie=UTF-8&text=$URL&sl=$FROM&tl=$TO" | awk -F'"' '{print $2}'
}

#　play ja to en translation in background with mpv
function say () {
    local LANG=$2
    local URL="$(echo "$1" | perl -MURI::Escape -ne 'chomp;print uri_escape($_)')"
    if [ -z "$2" ]; then LANG=EN; fi
    mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=$LANG&q=$URL" &> /dev/null
}

function powerline_precmd() {
  export PS1="$(~/bin/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd

alias rake="noglob rake"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=setting'

eval `ssh-agent` > /dev/null

export NVM_DIR="/home/scott/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
    fi
}

export GOPATH=/home/scott/src/gopath
