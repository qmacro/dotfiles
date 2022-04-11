#!/bin/bash

# GIT bash integration
# See https://gist.github.com/eliotsykes/47516b877f5a4f7cd52f

export GIT_PS1_SHOWCOLORHINTS='y'
export GIT_PS1_SHOWDIRTYSTATE='y'
export GIT_PS1_SHOWUNTRACKEDFILES='y'
export GIT_PS1_DESCRIBE_STYLE='contains'
export GIT_PS1_SHOWUPSTREAM='auto'

# shellcheck disable=SC1090
. "$HOME/dotfiles/git-prompt.sh"

__showlocation() {
  # Don't show work userids
  local username=$1
  if [[ ${username,,} =~ ^[idc][0-9]+$ ]]; then
    echo "\\w"
  else
    echo "\$PWD"
  fi
}

__is_theia() {
  env | grep THEIA > /dev/null
  return $?
}

__prompt_command() {
  local EXIT="$?"
  local promptcolour reset=$'\[\e[0m\]'
  local locationcolour=$'\[\e[0;34m\]'
  local symbols="▶ "

  # Location is shown in the Tmux status bar. But if Tmux
  # isn't running, show it in a prompt line.
  PS1="${locationcolour}# $(__showlocation "$USER")$(__git_ps1)\\n${reset}"

  # Make prompt red if last command failed
  [[ $EXIT == 0 ]] && promptcolour=$'\[\e[0;32m\]' || promptcolour=$'\[\e[0;31m\]'
  PS1+="${promptcolour}${symbols}${reset}"
}

PROMPT_COMMAND=__prompt_command
