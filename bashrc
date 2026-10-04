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

# opencode
export PATH=/home/dj/.opencode/bin:$PATH


# cds completion start
# cds shell completion script (path resolved at install time)
_p="/home/dj/.npm-packages/lib/node_modules/@sap/cds-dk/bin/completion/scripts/cds.sh" && [ -r "$_p" ] && . "$_p"
# cds completion end