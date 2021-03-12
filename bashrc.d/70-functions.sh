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
      location="$HOME/Projects/$blog"
      cd "$location" || exit 1

      tmux new -s "$blog"
      vim +7 -c "Goyo" "$location/$(createnewpost "$@")"
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

