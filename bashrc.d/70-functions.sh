repo() {
  export REPO="$1"
}

newpost() {

  local blog
  blog=$(
    printf "qmacro.github.io\nautodidactics" \
      | fzf --no-border --inline-info
    )

  if [[ -n "$blog" ]]; then
    cd "$HOME/Projects/$blog" || exit 1
    createnewpost "$@"
    git status
  fi

}
