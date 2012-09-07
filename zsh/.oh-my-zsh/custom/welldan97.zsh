[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# open with default opener
alias o=xdg-open

bindkey '\eq' push-line-or-edit

alias reload-zsh='source ~/.zshrc'
alias gam='git commit --amend'

export EDITOR=pico
