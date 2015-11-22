# Git

alias gcn!="git commit -v --amend --no-edit"
alias gcan!="git commit -v -a --amend --no-edit"
alias glgo="git log --graph --oneline --all --decorate"
gp!() { git push $1 $(git rev-parse --abbrev-ref HEAD) }
gd1()  { git diff $1\^ $1 }
gdh()  { git diff HEAD\^ }


# Apps

alias emacs='open -a Emacs'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias j="/Applications/j64-801/bin/jconsole"

# Else

alias zsh-reload='source ~/.zshrc'

mkcd() { mkdir -p "$@" && cd "$@" }
highlight-regexp() { sed "s/$1/\^$fg[blue]$1$fg[default]\$/" }
mktemp!() { mktemp $TMPDIR$1.XXXXXXXXXX }

# One letters

o() { open ${1:-'.'} }
e() { emacs ${1:-'.'} }
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
