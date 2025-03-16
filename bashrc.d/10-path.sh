# Add dotfiles scripts path and subpaths
while read -r path; do
  export PATH="$PATH:$path"
done <<< "$(find "$DOTFILES/scripts" -type d)"

# Have my user-specific bin dir take priority
export PATH="$HOME/.local/bin:$PATH"

# Add globally installed NPM package executables accessible too
export PATH="$PATH:$HOME/.npm-packages/bin"
