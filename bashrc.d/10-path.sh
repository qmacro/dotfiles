# Add dotfiles scripts path and subpaths
while read -r path; do
  export PATH="$PATH:$path"
done <<< "$(find "$DOTFILES/scripts" -type d)"

# Add games dir for lolcat (!)
export PATH="$PATH:/usr/games"

# Have my user-specific bin dir take priority
export PATH="$HOME/.local/bin:$PATH"

# Add globally installed NPM package executables accessible too
export PATH="$HOME/.npm-packages/bin:$PATH"
