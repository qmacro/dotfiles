export PATH="/usr/local/opt/openjdk/bin:$PATH" # brew-installed Java

# Brew-installed Node.js v12
export PATH="/usr/local/opt/node@12/bin:$PATH"

# Brew-installed Gnu utils
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Add dotfiles scripts path and subpaths
while read -r path; do
  export PATH="$PATH:$path"
done <<< "$(find "$DOTFILES/scripts" -type d)"

# Have my user-specific bin dir take priority
export PATH="$HOME/bin:$PATH"
