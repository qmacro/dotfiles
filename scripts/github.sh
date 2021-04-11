#!/usr/bin/env bash

# Function library for git and GitHub related scripts.

abort_if_not_repo() {

  if ! git status > /dev/null 2>&1; then
    echo Not a repository - aborting
    exit 1
  fi

}

get_hostname() {

  # Assumes that the repository we're in has an 'origin' remote
  git remote get-url origin | sed -E 's,^(https?://|git@)([^:/]+?).+$,\2,'

}

preview_window_location() {

  # Determines whether the fzf preview window should be at the
  # top or the right, depending on how wide the terminal is.
  local cols
  cols=$(tput cols)
  if [[ cols -gt 150 ]]; then
    echo right
  else
    echo up
  fi

}
