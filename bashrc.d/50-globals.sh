export EDITOR=nvim
export WORK="$HOME/work"

export HOSTALIASES="$HOME/.config/host.aliases"
export BLOG_REPO_LOCATION="$HOME/Projects"

export TERM=xterm-256color

# Source private (local) environment variables
privateenvvars="$HOME/.private_envvars.sh"
# shellcheck disable=1090
[ -f "$privateenvvars" ] && . "$privateenvvars"

# See https://github.blog/2021-03-11-scripting-with-github-cli/
type delta > /dev/null 2>&1 && export GIT_PAGER='delta -s'

# For use with the GitHub CLI 'gh' when making API calls
export GH_CACHETIME=1h

# Controls colour output in the terminal (e.g. with ls)
export CLICOLOR=true

# Standards
export XDG_CONFIG_HOME="$HOME/.config"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
# Use Docker's newer BuildKit backend
export DOCKER_BUILDKIT=1

export CF_HOME="$HOME/.config/cf"
