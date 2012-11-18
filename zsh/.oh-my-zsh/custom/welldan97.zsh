# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Default editor
export EDITOR=edit

# Open with default opener
alias o=xdg-open

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias gam='git commit --amend'
alias reload-zsh='source ~/.zshrc'

# Keybindings
bindkey '\eq' push-line-or-edit
