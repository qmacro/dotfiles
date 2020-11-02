export EDITOR=vim
export SAPCP_CLIENTCONFIG=${HOME}/.config/sapcp

# ln -s -f "$HOME/.dotfiles/host.aliases" "$HOME/.config/"
export HOSTALIASES="$HOME/.config/host.aliases"
export BLOG_REPO_LOCATION=~/local/projects

export TERM=xterm-256color

# Source private (local) environment variables
privateenvvars="$HOME/.private_envvars.sh"
# shellcheck disable=1090
[ -f "$privateenvvars" ] && . "$privateenvvars"
