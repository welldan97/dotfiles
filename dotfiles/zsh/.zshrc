ZSH=$HOME/.oh-my-zsh
ZSH_THEME="welldan97"

plugins=(bundler brew extract gem git gitflow github heroku knife rails3 redis-cli rvm thor vagrant)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin:$HOME/bin:/usr/local/share/npm/bin # Add RVM to PATH for scripting

export EDITOR=emacsclient

export PROJECT_CONFIGS_PATH=~/.welldan97/configs
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

setopt HIST_IGNORE_SPACE

eval "$(fasd --init auto)"
