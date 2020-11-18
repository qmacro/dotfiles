# Use the excellent base16 colour scheme system
# See https://github.com/chriskempson/base16-shell
# Requires the repo to be cloned into ~/.config/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# Add helper script to choose from favs
bscheme() {
  local choice
  choice=$(cat <<EOF | fzf
default-dark
circus
gruvbox-dark-soft
eighties
woodland
seti
railscasts
phd
oceanictext
monokai
materia
EOF
  )
  _base16 "$BASE16_SHELL/scripts/base16-${choice}.sh"
}

