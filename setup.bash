#!/usr/bin/env bash

DOTFILES=${HOME}/.dotfiles

# Dotfiles symlinks
figlet -f small symbolic links
ln -f -s ${DOTFILES}/bashrc ${HOME}/.bashrc
ln -f -s ${DOTFILES}/bash_aliases ${HOME}/.bash_aliases
ln -f -s ${DOTFILES}/vimrc ${HOME}/.vimrc
ln -f -s ${DOTFILES}/tmux.conf ${HOME}/.tmux.conf
ln -f -s ${DOTFILES}/gitconfig ${HOME}/.gitconfig
echo symbolic links set

# Tmux Plugin Manager (remember to install plugins with prefix I)
if [[ ! -d ${HOME}/.tmux/plugins/ ]]
then
  figlet -f small tmux
  mkdir -p ${HOME}/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
fi

# Ranger
figlet -f small ranger
ranger --copy-config=all
ln -f -s ${DOTFILES}/ranger/rc.conf ${HOME}/.config/ranger/rc.conf

# nvm
figlet -f small nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

