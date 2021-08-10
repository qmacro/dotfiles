export EDITOR=vim

# ln -s -f "$HOME/.dotfiles/host.aliases" "$HOME/.config/"
export HOSTALIASES="$HOME/.config/host.aliases"
export BLOG_REPO_LOCATION="$HOME/Projects"

export TERM=xterm-256color

# Source private (local) environment variables
privateenvvars="$HOME/.private_envvars.sh"
# shellcheck disable=1090
[ -f "$privateenvvars" ] && . "$privateenvvars"

# See https://github.blog/2021-03-11-scripting-with-github-cli/
export GIT_PAGER='delta -s'

# For use with the GitHub CLI 'gh' when making API calls
export GH_CACHETIME=1h

# Controls colour output in the terminal (e.g. with ls)
export CLICOLOR=true

# Standards
export XDG_CONFIG_HOME="$HOME/.config"
