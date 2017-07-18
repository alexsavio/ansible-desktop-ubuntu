#!/bin/bash

CURRENT=`pwd`

if [ -d "/home/${USER}/Desktop/Parallels Shared Folders/Home/.ssh" ]; then
    mkdir "${HOME}/.ssh"
    cp -rdv /home/tracking/Desktop/Parallels\ Shared\ Folders/Home/.ssh/id_rsa* "${HOME}/.ssh"

    chmod 700 "${HOME}/.ssh"
    chmod 600 "${HOME}/.ssh/*"
fi

echo "Installation de python......."
sudo apt-get install -y -qq python python-pip git git-core openssh-server libssl-dev

echo "Installation d'ansible......."
sudo pip install -U pip setuptools

echo "Installation d'ansible......."
sudo pip install ansible

echo "Clone de la config d'installation."
sudo -u `whoami` -H git clone git@git.maibornwolff.de:Tracking-AR-Testbench/dev_provision.git $HOME/.config-desktop-home
