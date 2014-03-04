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

alias get="wget -r -c -np --no-check-certificate --user=`cat ~/.suser`--password=`cat ~/.spasswd`"

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
