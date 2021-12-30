# All aliases in here
alias vi=vim
alias kitty=/Applications/kitty.app/Contents/MacOS/kitty
alias twt='[ "$TMUX" ] && tmux display-message -p "#W"'
alias tm='tmux attach-session -t $(basename "$PWD") || tmux new-session -s $(basename "$PWD")'
alias python=/usr/local/bin/python3
alias cgr='cg && r'
alias vig='vim -c "Goyo"'
alias wfb='workflowbrowser'
alias wfe='workflowbrowser | xargs showgithubcontent | vim --not-a-term -' # workflow edit
alias branch='git checkout -b'
alias pr='git push --set-upstream origin $(git branch --show-current) && gh pr create --body'

# See https://superuser.com/questions/763071/show-whitespace-characters-in-printout
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"

# GitHub CLI - issue management
alias in='gh issue create'
alias iv='gh issue view'
alias ie='gh issue edit'
alias ic='gh issue comment'

# Show directory symbol (/) and hidden directories
alias ls='ls -p -a'

# Single char aliases
alias s='git status'
alias k=kubectl
alias r=ranger
alias t=tmux
alias i='gh issue list'
alias v=vim
