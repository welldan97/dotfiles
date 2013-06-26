source ~/.oh-my-zsh/custom/product.zsh
source ~/.oh-my-zsh/custom/system-wide-clipboard.zsh

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


setopt HIST_IGNORE_SPACE
# Default editor
export EDITOR=edit

# Open with default opener
alias o=open
alias u=gumba

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias e=emacsclient -t
alias ec=emacsclient -c

alias gcn!="git commit -v --amend --no-edit"
alias gcan!="git commit -v -a --amend --no-edit"

alias zsh-reload='source ~/.zshrc'
alias source-tree="open -a SourceTree ."
mkcd () { mkdir -p "$@" && cd "$@" }

c () {
    local prev=$PWD
    [[ -d "$@" ]] && cd "$@" || z "$@"
    [[ $PWD != $prev ]] && ls -a
}

new_rails_app(){
    name=$1
    defaults=${2:-default}
    echo $defaults
    rails_apps_composer new $name -d ~/.ruby_and_rails/rails_apps_composer/defaults/$defaults.yaml -l ~/.ruby_and_rails/rails_apps_composer/recipes #
}

# Keybindings
bindkey '\eq' push-line-or-edit

# Init Fasd
eval "$(fasd --init auto)"