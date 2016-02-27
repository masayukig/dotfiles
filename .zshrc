# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv shell 2.0.0-p0
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
export PATH=/usr/local/mysql/bin:/usr/local/opt/postgresql/bin:$HOME/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH
export PATH=$PATH:$HOME/adt-bundle-latest/sdk/platform-tools
export PATH=$PATH:$HOME/apktool
export PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-darwin/
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH=/usr/local/bin:$PATH

export PYTHONSTARTUP=$HOME/.pythonrc.py
#alias greadline readline
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.11/lib/pkgconfig
export DOCKER_HOST=tcp://localhost:2375
