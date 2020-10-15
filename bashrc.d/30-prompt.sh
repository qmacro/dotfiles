export PS1_START="\[\033[36m\]\u\[\033[33m\]@\[\033[1;34m\]\h\[\033[0m\]"
export PS1_DIR="\[\033[0;33m\][\w]\[\033[0m\]"
export PS1_END="\n\[\033[37m\]> \[\033[0m\]"
PS1="${PS1_DIR} ${PS1_END}"

# For bash-git-prompt (https://github.com/magicmonty/bash-git-prompt)
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_START="${PS1_DIR}"
  GIT_PROMPT_END="${PS1_END}"
  source $HOME/.bash-git-prompt/gitprompt.sh
fi
