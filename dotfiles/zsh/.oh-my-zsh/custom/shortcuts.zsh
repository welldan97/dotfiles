# One letters

alias o=open
alias u=gumba
e() { emacsclient ${1:-'.'} & }
c() {
    local prev=$PWD
    [[ -d "$@" ]] && cd "$@" || z "$@"
    [[ $PWD != $prev ]] && ls -a
}

# Git

alias gcn!="git commit -v --amend --no-edit"
alias gcan!="git commit -v -a --amend --no-edit"
alias glgo="git log --graph --oneline --all --decorate"
gp!() { git push $1 $(git rev-parse --abbrev-ref HEAD) }

# Else

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias zsh-reload='source ~/.zshrc'
alias source-tree="open -a SourceTree ."

mkcd() { mkdir -p "$@" && cd "$@" }
highlight-regexp() { sed "s/$1/\^$fg[blue]$1$fg[default]\$/" }
reveal() { c $(dirname $1) }
