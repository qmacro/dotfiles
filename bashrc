# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# See https://github.com/platformio/platformio-atom-ide-terminal/issues/196#issuecomment-391707383
update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PS1_START="\[\033[36m\]\u\[\033[33m\]@\[\033[1;34m\]\h\[\033[0m\]"
export PS1_DIR="\[\033[0;33m\][\w]\[\033[0m\]"
export PS1_END="\n\[\033[37m\]❯ \[\033[0m\]"
PS1="${PS1_START} ${PS1_DIR} ${PS1_END}"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.dotfiles/scripts:$PATH
export PATH=$HOME/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# For bash-git-prompt (https://github.com/magicmonty/bash-git-prompt)
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_START=${PS1_START}
  GIT_PROMPT_END=" ${PS1_DIR} ${PS1_END}"
  source $HOME/.bash-git-prompt/gitprompt.sh
fi

export EDITOR=vim

set -o vi
bind -x '"\C-l": clear'

# SAP CP CLI configuration
export SAPCP_CLIENTCONFIG=${HOME}/.config/sapcp

# Maintain host aliases so as not to expose work machine hostnames
# Note that ~/.dotfiles/host.aliases is not git controlled
ln -s -f "$HOME/.dotfiles/host.aliases" "$HOME/.config/"
export HOSTALIASES="$HOME/.config/host.aliases"

# Use the excellent base16 colour scheme system
# See https://github.com/chriskempson/base16-shell
# Requires the repo to be cloned into ~/.config/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
		eval "$("$BASE16_SHELL/profile_helper.sh")"

shopt -s huponexit
export BSR_EXCLUDE=light
