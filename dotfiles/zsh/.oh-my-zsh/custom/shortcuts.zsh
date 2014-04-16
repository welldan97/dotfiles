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
gd1()  { git diff $1\^ $1 }
gdh()  { git diff HEAD\^ }


# Apps

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacsclient="/usr/local/bin/emacsclient"
alias terminal-notifier="/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier"

# Else

alias zsh-reload='source ~/.zshrc'

mkcd() { mkdir -p "$@" && cd "$@" }
highlight-regexp() { sed "s/$1/\^$fg[blue]$1$fg[default]\$/" }
