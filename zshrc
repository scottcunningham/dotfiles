# Set up history
export HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY # This lets us share ~/.zsh_history between different zsh instances
export HISTSIZE=50000
export SAVEHIST=50000

eval `dircolors -b`

zstyle ':completion:*' menu select

setopt completealiases autocd # Who needs to type cd? Not me

export GPGKEY=0E486FCC

alias cube='ssh scott@cube.netsoc.tcd.ie'
alias spoon='ssh scott@spoon.netsoc.tcd.ie'
alias cubex='ssh -X scott@cube.netsoc.tcd.ie'
alias spoonx='ssh -X scott@spoon.netsoc.tcd.ie'

alias ls="ls -F"
alias vi=vim
alias l=ls
alias ll="ls -lh"
alias grep='grep --colour'
alias gitgasm='git log --pretty=format:"%h -- %cr -- %an (%ae) -- %s"'

alias get="wget -r -c -np --no-check-certificate --user=`cat ~/.seeduser`--password=`cat ~/.seedpassword`"

local blue="%{"$'\e[1;34m'"%}"
local cyan="%{"$'\e[1;36m'"%}"
local red="%{"$'\e[1;31m'"%}"
local gray="%{"$'\e[1;30m'"%}"
local GRAY="%{"$'\e[0;37m'"%}"
local green="%{"$'\e[1;32m'"%}"
local GREEN="%{"$'\e[0;32m'"%}"
local white="%{"$'\e[1;37m'"%}"
local NOCOLOR="%{"$'\e[0m'"%}"

if echo $TERM | grep "rxvt-unicode-256color" > /dev/null; then
	export TERM=xterm
fi

# PROMPTS \o/
PROMPT2="%F{[%d]}%_>"
# %* = time
# %n = username
PROMPT="%n@%m%~:> "
RPROMPT='[%*]' # Right prompt because we can 

# To-do list at top of shell
if [ -f ~/todo ]; then cat ~/todo; fi

# Completion :)
zmodload zsh/complist
autoload -U compinit && compinit

_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1	# Because we didn't really complete anything
}

# Intel C compiler weeew
source /opt/intel/bin/compilervars.sh intel64

# ARM cross-compilers
export PATH=$PATH:$HOME/bin/arm-2008q3/bin

zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
