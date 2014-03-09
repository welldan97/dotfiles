# One letters

o() { open ${1:-'.'} & }
e() { emacsclient ${1:-'.'} & }
c() {
    local previous=$PWD
    if [[ -d "$@" ]]; then
        cd "$@"
    elif [[ -f "$@" ]]; then
        cd $(dirname "$@")
    else
        fasd_cd -d "$@"
    fi

    if [[ $PWD != $previous ]]; then
        ls -a
    fi
}

# Git

alias gcn!="git commit -v --amend --no-edit"
alias gcan!="git commit -v -a --amend --no-edit"
alias glgo="git log --graph --oneline --all --decorate"
gp!() { git push $1 $(git rev-parse --abbrev-ref HEAD) }

# Else

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacsclient="/usr/local/bin/emacsclient"
alias zsh-reload='source ~/.zshrc'
alias source-tree="open -a SourceTree ."

mkcd() { mkdir -p "$@" && cd "$@" }
highlight-regexp() { sed "s/$1/\^$fg[blue]$1$fg[default]\$/" }
reveal() { c $(dirname $1) }
