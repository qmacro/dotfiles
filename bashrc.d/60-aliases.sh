# All aliases in here
alias vi=vim
alias d="cd \$HOME/.dotfiles && git status"
alias k=kubectl
alias kitty=/Applications/kitty.app/Contents/MacOS/kitty
alias r=ranger
alias twt='[ "$TMUX" ] && tmux display-message -p "#W"'
alias tm='tmux attach-session -t $(basename "$PWD") || tmux new-session -s $(basename "$PWD")'
alias python=/usr/local/bin/python3
alias t=tmux
alias cgr='cg && r'
alias vig='vim -c "Goyo"'
alias wfb='workflowbrowser'
alias wfe='workflowbrowser | xargs showgithubcontent | vim --not-a-term -' # workflow edit
alias branch='git checkout -b'
alias pr='git push --set-upstream origin $(git branch --show-current) && gh pr create'

# See https://superuser.com/questions/763071/show-whitespace-characters-in-printout
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"
