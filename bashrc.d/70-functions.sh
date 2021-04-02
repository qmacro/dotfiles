repo() {
  export REPO="$1"
}

chooseblog() {
  printf "qmacro.github.io\nautodidactics" \
    | fzf --no-border --inline-info
}

newpost() {

  if [[ $# -eq 0 ]]; then

    echo "No title supplied"

  else

    local blog location
    blog=$(chooseblog)

    if [[ -n "$blog" ]]; then
      location="$HOME/Projects/gh/github.com/qmacro/$blog"
      cd "$location" || exit 1

      vim +7 "$location/$(createnewpost "$@")"
      git status
    fi

  fi

}

editpost() {

  local blog location post
  blog=$(chooseblog)

  if [[ -n "$blog" ]]; then
    location="$HOME/Projects/$blog"
    cd "$location" || exit 1

    # shellcheck disable=2012
    post=$(ls -1tr _posts/ | tail -1)

    tmux new -s "$blog" "TERM=xterm-256color vim +7 -c 'Goyo' $location/_posts/$post"
  fi

}

j() {

  # Start new journal entry
  cd "$HOME/Projects/gh/github.com/qmacro/thinking-aloud" || exit
  gh issue create --label entry --title "$(date '+%Y-%m-%d %H:%M:%S')"
}

choose_tmux_session() {

  tmux ls | fzf --layout=reverse --border --info=inline --margin=8,20 --padding=1 | cut -d: -f 1

}
