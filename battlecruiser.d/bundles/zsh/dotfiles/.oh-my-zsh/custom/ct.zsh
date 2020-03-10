ct() {
  cd "$(git-top)"
  zle reset-prompt
}

zle -N ct
