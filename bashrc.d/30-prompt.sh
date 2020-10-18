#!/bin/bash

# GIT bash integration
# See https://gist.github.com/eliotsykes/47516b877f5a4f7cd52f

# shellcheck disable=SC1090
. "$HOME/.dotfiles/git-prompt.sh"

declare red='\e[31m'
declare reset='\e[0m'

export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

__errorcolour() {
  [[ $1 -eq 0 ]] && echo "$reset" || echo "$red"
}

PROMPT_COMMAND='__git_ps1 "\w" "\n$(__errorcolour $?)> $reset"'
