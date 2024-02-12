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
    ## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#B4B6B9'
## Constants
## Entitites
## Functions/methods
export ZSH_HIGHLIGHT_STYLES[alias]='fg=#6F42C1'
export ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#6F42C1'
export ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#6F42C1'
export ZSH_HIGHLIGHT_STYLES[function]='fg=#6F42C1'
export ZSH_HIGHLIGHT_STYLES[command]='fg=#6F42C1'
export ZSH_HIGHLIGHT_STYLES[precommand]='fg=#6F42C1,underline'
export ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#FFB86C,underline'
export ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#765ba7'
export ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#765ba7'
export ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#BD93F9, underline'
## Keywords
## Built ins
export ZSH_HIGHLIGHT_STYLES[builtin]='fg=#6F42C1'
export ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=#949597
export ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#8BE9FD,underline'
## Punctuation
export ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#949597'
export ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#b39e00,underline'
export ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#b39e00,underline'
export ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#b39e00,underline'
export ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#949597'
export ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#949597'
export ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#949597'
## Serializable / Configuration Languages
## Storage
## Strings
export ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#c20000,bold'
export ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#c20000,bold'
export ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#b39e00'
## Variables
export ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#000000,bold'
export ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#c20000,bold'
export ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#000000,bold'
export ZSH_HIGHLIGHT_STYLES[assign]='fg=#000000,bold'
export ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#b39e00'
## No category relevant in spec
export ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#c20000,bold'
export ZSH_HIGHLIGHT_STYLES[path]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#FF79C6'
export ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#FF79C6'
export ZSH_HIGHLIGHT_STYLES[globbing]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#BD93F9'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
export ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#c20000,bold'
export ZSH_HIGHLIGHT_STYLES[redirection]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[arg0]='fg=#b39e00'
export ZSH_HIGHLIGHT_STYLES[default]='fg=#000000'
export ZSH_HIGHLIGHT_STYLES[cursor]='standout'

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
