dotfiles
========

These are my config files.

- git
- zsh
- tmux
- emacs
- vim, gvim
- etc...

how to use
==========
::

    $ cd some/local/directory
    $ git clone git://github.com/masayukig/dotfiles.git
    $ ./dotfiles/create_symlink.sh

    # Install virtualenv
    $ sudo zypper install python-pip
    $ sudo pip install virtualenvwrapper
    $ sudo pip2 install virtualenvwrapper

    # Install prezto
    $ git clone https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    $ cd .zprezto
    $ git remote add masayukig git@github.com:masayukig/prezto.git
    $ git checkout masayukig change-prompt
    $ less README.md # install .zprezto

    # To use diff-highlight
    $ sudo pip install diff-highlight
    # To use vim plugins
    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    $ vim +PluginInstall +qall

gnupg
-----
::

    $ gpg --export -a > public.asc
    $ gpg --export-secret-keys -a > secret.asc
    $ gpg --export-ownertrust > trust.txt
    $ scp public.asc secret.asc trust.txt $HOST2:/home/masayukig/.gnupg/

    on $HOST2
    $ gpg --import public.asc
    $ gpg --import secret.asc
    $ gpg --import-ownertrust trust.txt

Gertty
------
::

    $ git clone https://review.openstack.org/openstack/gertty git/openstack/gertty
    $ scp .gertty.db .gertty.yaml $IP_ADDRESS:/home/$USER/
    $ sudo pip install -e git/openstack/gertty

Conky
-----
::

    $ sudo zypper install conky
    $ git clone https://github.com/zenzire/conkyrc.git ~/.conky

Emacs packages
--------------
::

    (In a emcas environment)
    M-x package-refresh-contents
    M-x package-install FOO
