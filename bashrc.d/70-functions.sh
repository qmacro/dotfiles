repo() {
  export REPO="$1"
}

newpost() {

  local blog location
  blog=$(
    printf "qmacro.github.io\nautodidactics" \
      | fzf --no-border --inline-info
    )

  if [[ -n "$blog" ]]; then
    location="$HOME/Projects/$blog"
    cd "$location" || exit 1
    vim +7 -c "Goyo" "$location/$(createnewpost "$@")"
    git status
  fi

}
