source ~/.oh-my-zsh/custom/product.zsh
 
# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Default editor
export EDITOR=edit

# Open with default opener
alias o=open

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias gam='git commit --amend'
alias reload-zsh='source ~/.zshrc'

mkcd () { mkdir -p "$@" && cd "$@" }

new_rails_app(){
    name=$1
    defaults=${2:-default}
    echo $defaults
    rails_apps_composer new $name -d ~/.ruby_and_rails/rails_apps_composer/defaults/$defaults.yaml -l ~/.ruby_and_rails/rails_apps_composer/recipes # 
}

# Keybindings
bindkey '\eq' push-line-or-edit
