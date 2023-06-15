#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load all the other stuff
for script in `ls ${HOME}/.zsh/*.zsh`; do
    source $script;
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
