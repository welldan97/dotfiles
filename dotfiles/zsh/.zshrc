main() {
  use-boxen

  set-up-main
  set-up-path

  use-oh-my-zsh
  use-fasd
  use-direnv

  use-zsh-syntax-highlighting
}

set-up-main() {
  export DOTFILES_DIR="/Users/welldan97/main/products/omega/myself/2013/dotfiles/main"

  source "$DOTFILES_DIR/configuration/env/public.sh"
  source "$DOTFILES_DIR/configuration/env/private.sh"

  export EDITOR=$EMACS_CLIENT_PATH

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
    bgnotify
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
    gem
    git
    gitflow
    github
    heroku
    knife
    rails3
    redis-cli
    rvm
    thor
    vagrant
  )

 setopt HIST_IGNORE_SPACE
}

set-up-path() {
  # ~/bin
  export PATH=$HOME/bin:$PATH
  # Postgres.app
  export PATH=$PATH:$POSTGRES_APP_BIN_PATH
}

use-boxen() {
  if [ -e "/opt/boxen/env.sh" ]; then
    source /opt/boxen/env.sh
  fi
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
  source $HOMEBREW_ROOT/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
}

main
