# All aliases in here
alias vi=vim
alias d="cd \$HOME/.dotfiles && git status"
alias k=kubectl
alias kitty=/Applications/kitty.app/Contents/MacOS/kitty
alias r=ranger
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))"'
alias twt='[ "$TMUX" ] && tmux display-message -p "#W"'
alias tm='tmux attach-session -t $(basename "$PWD") || tmux new-session -s $(basename "$PWD")'
alias python=/usr/local/bin/python3
alias t=tmux
alias cg='cd $(find ~/Projects/gh -type d -mindepth 3 -maxdepth 3 | fzf --height 60% --reverse) && ls'
alias cgr='cg && r'
alias vig='vim -c "Goyo"'
