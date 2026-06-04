# All aliases in here
alias wfb='workflowbrowser'
alias wfe='workflowbrowser | xargs showgithubcontent | vim --not-a-term -' # workflow edit
alias pr='git push --set-upstream origin $(git branch --show-current) && gh pr create --body'

# See https://superuser.com/questions/763071/show-whitespace-characters-in-printout
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"

# GitHub CLI - issue management
alias in='gh issue create'
alias iv='gh issue view'
alias ie='gh issue edit'
alias ic='gh issue comment'

# Show directory symbol (/) and hidden directories
alias ls='ls -p -a --color=auto'

# Single char aliases
alias s='cd /work/scratch'
alias k=kubectl
alias t=tmux
alias i='gh issue list'
alias d='cd $DOTFILES'
alias r=reset

alias st='git status'
alias dpa='docker ps -a --format "table {{.Names}}\t{{.State}}\t{{.RunningFor}}\t{{.Networks}}\t{{.Mounts}}"'

# (n)vi(m)
alias v=nvim
alias vi=nvim
alias vim=nvim

alias gapi='gh api --paginate --cache 1h'

alias bat=batcat
alias blog='cd $WORK/gh/github.com/qmacro/qmacro.github.io'

# GitHub Enterprise gh
# See https://github.com/dlvhdr/gh-dash/issues/285#issuecomment-1785135817
alias ghe='GH_HOST=github.tools.sap gh'
