#!/usr/bin/env bash

repo() {
  export REPO="$1"
}

g() {

  # Change to a git repo
  # --------------------

  local target
  local repo

  # Fall back to what was originally given if a short form can't be resolved
  repo=${repo:-$1}

  target=$(
    find "$WORK/gh" -mindepth 3 -maxdepth 3 -type d \
      | sed -E 's/^(.+\/gh(\/.+?))$/\2\t\1/' \
      | fzf --with-nth=1 --select-1 --query="$repo" --height=60% --reverse \
      | cut -f 2
  )

  if [[ -n "$target" ]]; then
    cd "$target" && ls -a && git status --short --branch
  fi

}

authenv() {

  # Export env vars for auth, for a given service
  # and identify (default 'qmacro').
  local service=$1
  local identity=${2:-qmacro}
  if [[ -z $service ]]; then
    echo "Specify service e.g. strava, youtube and optional identity (default qmacro)"
  else
    echo -n "Setting $identity auth env vars "
    local envvar
    for file in "$HOME/.auth/$service/$identity/"*; do
      envvar="${service^^}_$(basename "$file")"
      export "$envvar"="$(cat "$file")"
      echo -n "$envvar "
    done
    echo
  fi

}

search() {
  local IFS="+"
  open "https://google.com/search?q=$*"
}

focus() {
  echo "$*" > "$HOME/.focus-status"
}

ss() {

  # Gets most recent screenshot file & moves it to specified location
  local shot dest=$1
  shot="$(find "$HOME/work/shots/" -name "screenshot*at*png" | sort | tail -1)"
  mv "$shot" "${dest}.png"

}

nd() {
  # Create new directory and cd into it
  mkdir "$1" && { cd $_ || :; }
}

ssp() {

  # Stack@SAP Pending
  cd "$HOME/work/gh/github.tools.sap/I347491/stack-api-tools" || :
  ./pending > /tmp/pending.dat
  grep 'Best Practices' /tmp/pending.dat | pbcopy
  while read -r url; do
    chrome-cli open "$url"
  done < <(grep '^http' /tmp/pending.dat)

}

addpath() {

  export PATH="$PATH:$PWD"

}



# nvc - (n)vim configs
nvc() {

  local configdir=nvim-configs

  local config
  config="$(
    find "$HOME/.config/$configdir" \
    -mindepth 1 \
    -maxdepth 1 \
    -printf "%f\n" \
    | fzf
  )"

  export NVIM_APPNAME="$configdir/${config:-nvim}"
  sed -i -E 's#(NVIM_APPNAME)=.*$#\1='"$NVIM_APPNAME"'#' $HOME/dotfiles/bashrc.d/54-globals-nvim.sh


  nvim "$@"

}
