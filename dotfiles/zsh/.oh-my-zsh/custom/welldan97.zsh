source ~/.oh-my-zsh/custom/system-wide-clipboard.zsh
source ~/.oh-my-zsh/custom/git.zsh
source ~/.oh-my-zsh/custom/encrypt-decrypt-dir.zsh
source ~/.oh-my-zsh/custom/keybindings.zsh

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

setopt HIST_IGNORE_SPACE

# Default editor
export EDITOR=edit

export PROJECT_CONFIGS_PATH=~/.welldan97/configs

# Open with default opener
alias o=open
alias u=gumba

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"

alias gcn!="git commit -v --amend --no-edit"
alias gcan!="git commit -v -a --amend --no-edit"
alias glgo="git log --graph --oneline --all --decorate"
gp!() { git push $1 $(git rev-parse --abbrev-ref HEAD) }

alias zsh-reload='source ~/.zshrc'
alias source-tree="open -a SourceTree ."
mkcd () { mkdir -p "$@" && cd "$@" }

e() { emacsclient ${1:-'.'} & }
ec() { emacsclient -c ${1:-'.'} & }

new_rails_app(){
    name=$1
    defaults=${2:-default}
    echo $defaults
    rails_apps_composer new $name -d ~/.ruby_and_rails/rails_apps_composer/defaults/$defaults.yaml -l ~/.ruby_and_rails/rails_apps_composer/recipes #
}

# Init Fasd
eval "$(fasd --init auto)"

c () {
    local prev=$PWD
    [[ -d "$@" ]] && cd "$@" || z "$@"
    [[ $PWD != $prev ]] && ls -a
}
