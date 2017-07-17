Automated Desktop Setup
=======================

Requirements
-----------

    * curl,
    * git,
    * git-core.

Run
---

If you want to change anything :

```shell
$ curl -L sudo apt-get install -y -qq python python-pip git git-core openssh-server | sh
```

And enter your password.

Default installation
--------------------

This project will install the following packages:

    * aptitude
    * bash-completion
    * openssh-server
    * vim
    * git, git-core
    * curl
    * wget
    * htop
    * ack-grep
    * tmux
    * tig
    * unzip, tar, gzip, bzip2
    * pwgen
    * Java 1.7.x (Oracle)

Custom installation
-------------------

if you want to customize the installation to suit your needs, you have to clone this repository :

    $ git clone git@github.com:alexsavio/ansible-desktop-ubuntu.git

And you have to edit the file `site.yml` and comment line the list roles. For example :

```yml
##
# Ansible playbook for setting up a LAMP development server on Ubuntu 14.04.
#

---
- hosts: local
  user: alexandre
  sudo: yes

  vars_files:
    - group_vars/all.yml

  roles:
    - common    # List of essential packages
```

Install Ansible :

    $ sudo apt-get install -y -qq python python-pip
    $ sudo pip install ansible

And execute command :

    $ ansible-playbook -i hosts site.yml -c local -K

You can also contribute to add new roles or improve existing.

License
-------

MIT / BSD
