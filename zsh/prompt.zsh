prompt scottbpc

autoload -U colors && colors
function parse_hg_branch {
  if [[ -n $(_scm_prompt) ]]; then
    # wrap in parens
    echo "$(_scm_prompt)"
  fi
}
function hgproml {
  local user="%{$fg[green]%}%n"
  local at="%{$fg[yellow]%}@"
  local host="%{$fg[green]%}%m"

  export PS1="$user$at$host%{$fg[yellow]%}:\$(parse_hg_branch)%{$reset_color%} "
  PS2='> '
  PS4='+ '
}
hgproml

#function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
#}
#
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
#
#if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
#fi
#
