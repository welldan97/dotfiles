#!/bin/bash
# NOTE: this shebang is only for shellcheck support

# Utils
# ==============================================================================

use_brew_fix() {
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

use_battlecruiser() {

  # Add scripts to path
  touch ~/.config/battlecruiser/build/scripts

  next_path=''
  while read -r line; do
    next_path="$next_path:$line"
  done <~/.config/battlecruiser/build/scripts

  export PATH="$PATH$next_path"

  # Run shell additions
  touch ~/.config/battlecruiser/build/shell
  while read -r line; do
    # shellcheck disable=SC1090
    source "$line"
  done <~/.config/battlecruiser/build/shell
}

use_oh_my_zsh() {
  ZSH="$HOME/.oh-my-zsh"

  # shellcheck disable=SC1090
  source "$ZSH/oh-my-zsh.sh"
}

use_zsh_syntax_highlighting() {
  # shellcheck disable=SC1091
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export ZSH_HIGHLIGHT_STYLES[default]=none
  export ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=#CD3131,bold
  export ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=#D73A49
  export ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=#22863A,underline
  export ZSH_HIGHLIGHT_STYLES[global-alias]=fg=#005CC5
  export ZSH_HIGHLIGHT_STYLES[precommand]=fg=#032F62,underline
  export ZSH_HIGHLIGHT_STYLES[commandseparator]=none
  export ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=#032F62,underline
  export ZSH_HIGHLIGHT_STYLES[path]=underline
  export ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
  export ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
  export ZSH_HIGHLIGHT_STYLES[globbing]=fg=#032F62
  export ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=#032F62
  export ZSH_HIGHLIGHT_STYLES[command-substitution]=none
  export ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=#B39E00
  export ZSH_HIGHLIGHT_STYLES[process-substitution]=none
  export ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=#B39E00
  export ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
  export ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
  export ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
  export ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=#B39E00
  export ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=#005CC5
  export ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=#005CC5
  export ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=#005CC5
  export ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=#333333
  export ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=#333333
  export ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=#333333
  export ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=#333333
  export ZSH_HIGHLIGHT_STYLES[assign]=none
  export ZSH_HIGHLIGHT_STYLES[redirection]=fg=#D73A49
  export ZSH_HIGHLIGHT_STYLES[comment]=fg=#6A737D,bold
  export ZSH_HIGHLIGHT_STYLES[named-fd]=none
  export ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
  export ZSH_HIGHLIGHT_STYLES[arg0]=fg=#032F62
}
use_zsh_syntax_autosuggestions() {
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
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
export ZSH_THEME=''
export DISABLE_UPDATE_PROMPT=true
export DISABLE_AUTO_UPDATE=true

export EDITOR="code --wait"

use_brew_fix
use_oh_my_zsh
use_battlecruiser
use_zsh_syntax_highlighting
use_zsh_syntax_autosuggestions
setup_plugins

# Smart matching of dashed values, e.g. f-b matching foo-bar
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'

# Separate history for different shells
unsetopt share_history
