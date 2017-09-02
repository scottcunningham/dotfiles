# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/Scott/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/Scott/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/Scott/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/Scott/.fzf/shell/key-bindings.zsh"
