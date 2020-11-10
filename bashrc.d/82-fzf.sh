[ -f ~/.fzf.bash ] && source ~/.fzf.bash
if type rg &>/dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
