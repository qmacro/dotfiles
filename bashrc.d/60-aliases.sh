# All aliases in here
alias vi=vim
alias d="cd \$HOME/.dotfiles && git status"
alias k=kubectl
alias kitty=/Applications/kitty.app/Contents/MacOS/kitty
alias r=ranger
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))"'
alias twt='[ "$TMUX" ] && tmux display-message -p "#W"'
alias tt='twt|dp'
alias tm='tmux new -s $(basename $PWD)'
