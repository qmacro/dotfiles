#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return ;;
esac

export DOTFILES="$HOME/dotfiles"

for rcfile in "$DOTFILES"/bashrc.d/*.sh; do
  # shellcheck disable=SC1090
  source "$rcfile"
done

source /Users/i347491/.docker/init-bash.sh || true # Added by Docker Desktop
