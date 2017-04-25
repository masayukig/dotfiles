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

    $ cd some/local/directory
    $ git clone git://github.com/masayukig/dotfiles.git
    $ ./dotfiles/create_symlink.sh

    # To use diff-highlight
    $ curl https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight > ~/bin/diff-highlight && chmod +x ~/bin/diff-highlight
    # To use vim plugins
    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    $ vim +PluginInstall +qall
