#!/usr/bin/env bash

repo() {
  export REPO="$1"
}

j() {

  # Start new journal entry
  cd "$HOME/Projects/gh/github.com/qmacro/thinking-aloud" || exit
  gh issue create --label entry --title "$(date '+%Y-%m-%d %H:%M:%S')"
}

choose_tmux_session() {

  tmux ls | fzf --layout=reverse --border --info=inline --margin=8,20 --padding=1 | cut -d: -f 1

}

g() {

  # Change to a git repo
  # --------------------

  local target
  local repo

  # Look for a repo name in case a short form is given
  repo=$(grep -E "^$1\s" "$HOME/.config/g/config.txt" | cut -f 2)

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
  echo "$*" | tee "$HOME/.focus" > "$HOME/.status"
}

ss() {

  # Gets most recent screenshot file & moves it to specified location
  local shot dest=$1
  shot="$(find "$HOME/work/shots/" -name "screenshot*at*png" | sort | tail -1)"
  mv "$shot" "${dest}.png"

}

f() {
  # Invoke fff as f and cd on exit
  fff "$@"
  cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")" || :
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

js() {

  # JSON scroll
  jq -C . < "$1" | less -R

}
