#!/bin/bash
# NOTE: this shebang is only for shellcheck support

main() {
  echo none for now
  #use-boxen

#  set-up-env
  #set-up-main
  #set-up-path

  #set-up-nvm
  #set-up-rbenv
  #use-oh-my-zsh
  #use-fasd
  #use-direnv

  #use-zsh-syntax-highlighting
  # Smart matching of dashed values, e.g. f-b matching foo-bar
  #zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'
}

# set-up-env() {
#   export DOTFILES_PATH="<%= dotfiles_path %>"
#   export DOTFILES_BIN_REPO="<%= dotfiles_bin_repo %>"
#
#   export AQUARIUM_MAIN="<%= aquarium_main %>"
#
#   export AQUARIUM_MEDIA="<%= aquarium_media %>"
#   export AQUARIUM_INFO="<%= aquarium_info %>"
#   export AQUARIUM_PRODUCTS="<%= aquarium_products %>"
#   export AQUARIUM_SUPPORT="<%= aquarium_support %>"
#
#   export AQUARIUM_CLOUD_STORAGE="<%= aquarium_cloud_storage %>"
#   export AQUARIUM_CLOUD_STORAGE_SOURCE="<%= aquarium_cloud_storage_source %>"
#
#   export AQUARIUM_DISPOSAL="<%= aquarium_disposal %>"
#   export AQUARIUM_DISPOSAL_SOURCE="<%= aquarium_disposal_source %>"
#
#   export AQUARIUM_BACKUP="<%= aquarium_backup %>"
#
#   export VLC_BIN_PATH="<%= vlc_bin_path %>"
#
#   export MANTRA_PATH="<%= mantra_path %>"
#
#   source "$DOTFILES_PATH/configuration/env/public.sh"
#   export EDITOR="atom -w"
# }

set-up-main() {
  # ZSH
  ZSH_THEME=$USER
  DISABLE_UPDATE_PROMPT=true
  DISABLE_AUTO_UPDATE=true

  plugins=(
    # aws
    # battery
    # cabal
    # capistrano
    # codeclimate
    # common-aliases
    # compleat
    # cpanm
    # jira
    bower
    bundler
    brew
    brew-cask
    coffee
    cp
    dircycle
    docker
    docker-compose
    ember-cli
    emoji
    extract
    fancy-ctrl-z
    gem
    git
    gitflow
    github
    grunt
    gulp
    heroku
    history-substring-search
    httpie
    jump
    kitchen
    knife
    meteor
    osx
    rails3
    redis-cli
    rvm
    thor
    vagrant
    w97-bgnotify
  )
}

set-up-path() {
  # ~/bin
  export PATH=$HOME/bin:$PATH
  # Postgres.app
  export PATH=$PATH:$POSTGRES_APP_BIN_PATH
  # Cabal
  export PATH=$PATH:"$HOME/.cabal/bin"
}

use-boxen() {
  if [ -e "/opt/boxen/env.sh" ]; then
    source /opt/boxen/env.sh
  fi
}

set-up-nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

set-up-rbenv() {
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
}

use-oh-my-zsh() {
  ZSH=$HOME/.oh-my-zsh

  source $ZSH/oh-my-zsh.sh
}

use-fasd() {
  eval "$(fasd --init auto)"
}

use-direnv() {
  eval "$(direnv hook zsh)"
}

use-zsh-syntax-highlighting() {
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
}

main

# NOTE: Should be here, otherwise it doesn't work
unsetopt share_history