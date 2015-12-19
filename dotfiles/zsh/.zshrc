main() {
  set-up-main
  set-up-path

  use-boxen
  use-oh-my-zsh
  use-fasd
  use-direnv

  use-zsh-syntax-highlighting
}

set-up-main() {
  export EDITOR='g/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'

  # ZSH
  ZSH_THEME='welldan97'
  DISABLE_UPDATE_PROMPT=true
  DISABLE_AUTO_UPDATE=true

  plugins=(
    bundler
    brew
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
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
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
