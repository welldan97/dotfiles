ZSH=$HOME/.oh-my-zsh
ZSH_THEME="welldan97"

# Boxen
if [ -e "/opt/boxen/env.sh" ]; then source /opt/boxen/env.sh; fi

plugins=(bundler brew extract gem git gitflow github heroku knife rails3 redis-cli rvm thor vagrant)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin:/usr/local/share/npm/bin # Add RVM to PATH for scripting

# Postgres.app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

export GOPATH="$HOME/.go/"
export PATH=$PATH:$GOPATH/bin # Add Go to PATH

export EDITOR=emacs

export PROJECT_CONFIGS_PATH=~/.welldan97/configs
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

setopt HIST_IGNORE_SPACE

eval "$(fasd --init auto)"
eval "$(direnv hook zsh)"
r() { /usr/bin/env r }

source $HOMEBREW_ROOT/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
