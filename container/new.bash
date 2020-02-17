#!/usr/bin/env bash

heading () {
  figlet -w 100 $@
}

CONTAINER=${1:-dev}
USER=${2:-dj}
SCRIPTDIR=$(dirname ${BASH_SOURCE[0]})

heading Setup container ${CONTAINER} and package update
lxc launch images:debian/buster ${CONTAINER}
lxc exec ${CONTAINER} -- 'apt update && apt upgrade -y'

heading Install of basic tools
lxc exec ${CONTAINER} -- apt install -y $(cat ${SCRIPTDIR}/installs | tr '\n' ' ')

heading Create user "${USER}" and environment
lxc exec ${CONTAINER} -- useradd -m -s /bin/bash ${USER}
lxc exec ${CONTAINER} -- mkdir /home/${USER}/.ssh
lxc exec ${CONTAINER} -- chown ${USER}:${USER} /home/${USER}/.ssh
lxc exec ${CONTAINER} -- chmod 700 /home/${USER}/.ssh
lxc file push ${HOME}/.ssh/id_rsa* ${HOME}/.ssh/known_hosts* ${CONTAINER}/home/${USER}/.ssh/

heading Cloning 'dotfiles' repo
lxc exec ${CONTAINER} -- su -c "git clone git@github.com:qmacro/dotfiles.git ~/.dotfiles" dj

heading Running dotfiles setup
lxc exec ${CONTAINER} -- su -c "~/.dotfiles/setup.bash" dj

heading Installing Node.js 12 LTS
lxc exec ${CONTAINER} -- su -c "nvm install 12 lts" dj

heading Entering ${CONTAINER} as ${USER}
echo "(Don't forget to install tmux plugins with 'prefix I')"
lxc exec ${CONTAINER} -- su - ${USER}


