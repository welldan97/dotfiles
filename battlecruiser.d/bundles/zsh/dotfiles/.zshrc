#!/bin/bash
# NOTE: this shebang is only for shellcheck support

# Utils
# ==============================================================================

use_battlecruiser() {
  next_path=''
  # add scripts to path
  while read -r line ; do
    next_path="$next_path:$line"
  done < ~/.config/battlecruiser/build/scripts

  export PATH="$PATH$next_path"
}

use_oh_my_zsh() {
  ZSH="$HOME/.oh-my-zsh"

  # shellcheck disable=SC1090
  source "$ZSH/oh-my-zsh.sh"
}

use_zsh_syntax_highlighting() {
  # shellcheck disable=SC1091
  source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null
}

setup_plugins() {
  export plugins=(
    brew
    brew-cask
    cp
    dircycle
    docker
    docker-compose
    emoji
    extract
    fancy-ctrl-z
    git
    gitflow
    github
    grunt
    gulp
    heroku
    history-substring-search
    httpie
    jump
    osx
  )
}


# Main
# ==============================================================================

# NOTE:should not have wrapper
# main() {

# ZSH
export ZSH_THEME='welldan97'
export DISABLE_UPDATE_PROMPT=true
export DISABLE_AUTO_UPDATE=true

export EDITOR="atom -w"

use_battlecruiser
use_oh_my_zsh
use_zsh_syntax_highlighting
setup_plugins

# Smart matching of dashed values, e.g. f-b matching foo-bar
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'

# Separate history for different shells
unsetopt share_history
