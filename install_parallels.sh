#!/bin/bash

CURRENT=`pwd`

if [ -d "/home/${USER}/Desktop/Parallels Shared Folders/Home/.ssh" ]; then
    mkdir "${HOME}/.ssh"
    cp -rdv /home/tracking/Desktop/Parallels\ Shared\ Folders/Home/.ssh/id_rsa* "${HOME}/.ssh"

    chmod 700 "${HOME}/.ssh"
    chmod 600 "${HOME}/.ssh/*"
fi

if [ ! -d ${HOME}/.config-desktop-home ]; then
    echo "\033[0;32m Installation de python.......\033[0m"
    sudo apt-get install -y -qq python python-pip git git-core openssh-server libssl-dev

    echo "\033[0;32m Installation d'ansible.......\033[0m"
    sudo pip install -U pip setuptools

    echo "\033[0;32m Installation d'ansible.......\033[0m"
    sudo pip install ansible

    echo "\033[0;32m Clone de la config d'installation.\033[0m"
    sudo -u `whoami` -H git clone git@git.maibornwolff.de:Tracking-AR-Testbench/dev_provision.git $HOME/.config-desktop-home
else
    echo "\033[0;32mThe folder ".config-desktop-home" is already installed\033[0m"
fi

cd $HOME/.config-desktop-home

ansible-playbook -i hosts site.yml -c local -K
