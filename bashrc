#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return ;;
esac

for rcfile in "$HOME"/.bashrc.d/*.sh; do
  # shellcheck disable=SC1090
  source "$rcfile"
done
