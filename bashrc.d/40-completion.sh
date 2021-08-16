# shellcheck disable=SC1090
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
  type brew > /dev/null 2>&1 \
    && [[ -f "$(brew --prefix)/etc/bash_completion" ]] \
    && "$(brew --prefix)/etc/bash_completion"
fi

# Exercism completion
if [ -f "$HOME/.config/exercism/exercism_completion.bash" ]; then
  . "$HOME/.config/exercism/exercism_completion.bash"
fi
