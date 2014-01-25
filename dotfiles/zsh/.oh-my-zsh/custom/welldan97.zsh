source ~/.oh-my-zsh/custom/system-wide-clipboard.zsh
source ~/.oh-my-zsh/custom/git.zsh
source ~/.oh-my-zsh/custom/encrypt-decrypt-dir.zsh
source ~/.oh-my-zsh/custom/new-rails-app.zsh

source ~/.oh-my-zsh/custom/shortcuts.zsh
source ~/.oh-my-zsh/custom/keybindings.zsh

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

setopt HIST_IGNORE_SPACE

# Default editor
export EDITOR=edit

export PROJECT_CONFIGS_PATH=~/.welldan97/configs

# Init Fasd
eval "$(fasd --init auto)"
