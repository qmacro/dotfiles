#!/bin/bash

# GIT bash integration
# See https://gist.github.com/eliotsykes/47516b877f5a4f7cd52f

export GIT_PS1_SHOWCOLORHINTS='y'
export GIT_PS1_SHOWDIRTYSTATE='y'
export GIT_PS1_SHOWUNTRACKEDFILES='y'
export GIT_PS1_DESCRIBE_STYLE='contains'
export GIT_PS1_SHOWUPSTREAM='auto'

# shellcheck disable=SC1090
. "$HOME/.dotfiles/git-prompt.sh"

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

  # Location is shown in the Tmux status bar. But if Tmux
  # isn't running, show it in a prompt line.
  PS1=""
  [ -z "$TMUX" ] && PS1="# $(__showlocation "$USER")$(__git_ps1)\\n"

  # Make prompt red if last command failed
  if [ $EXIT != 0 ]; then
    PS1+=$'\[\e[0;31m\]; \[\e[0m\]'
  else
    PS1+=$'; '
  fi
}

PROMPT_COMMAND=__prompt_command
