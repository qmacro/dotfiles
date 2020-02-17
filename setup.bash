#!/usr/bin/env bash

heading () {
  figlet $@
}

DOTFILES=${HOME}/.dotfiles

# Tmux Plugin Manager (remember to install plugins with prefix I)
if [[ ! -d ${HOME}/.tmux/plugins/ ]]
then
  heading tmux
  mkdir -p ${HOME}/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
fi

# Ranger
heading ranger
ranger --copy-config=all
ln -f -s ${DOTFILES}/ranger/rc.conf ${HOME}/.config/ranger/rc.conf

# nvm
heading nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

# ssh
if [ ! -d ${HOME}/.ssh/ ]; then
  heading ssh
  mkdir ${HOME}/.ssh/
  directory created
fi

# Dotfiles symlinks
heading symbolic links
ln -f -s ${DOTFILES}/bashrc ${HOME}/.bashrc
ln -f -s ${DOTFILES}/npmrc ${HOME}/.npmrc
ln -f -s ${DOTFILES}/bash_aliases ${HOME}/.bash_aliases
ln -f -s ${DOTFILES}/vimrc ${HOME}/.vimrc
ln -f -s ${DOTFILES}/tmux.conf ${HOME}/.tmux.conf
ln -f -s ${DOTFILES}/gitconfig ${HOME}/.gitconfig
ln -f -s ${DOTFILES}/ssh/config ${HOME}/.ssh/config
echo symbolic links set

