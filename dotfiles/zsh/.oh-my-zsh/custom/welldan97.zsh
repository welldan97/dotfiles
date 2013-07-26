source ~/.oh-my-zsh/custom/product.zsh
source ~/.oh-my-zsh/custom/system-wide-clipboard.zsh

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

# Keybindings
bindkey '\eq' push-line-or-edit

# Init Fasd
eval "$(fasd --init auto)"

encrypt-dir() {
    tar -c $1 | openssl enc -aes-256-cbc -e > $1.tar.enc
}
decrypt-dir() {
    openssl aes-256-cbc -d -in $1 | tar -x
}

encrypt-and-hide () {
    cp $1/image.jpg $(dirname $1)/image.jpg &&
    encrypt-dir $1 &&
    zip archive.zip $1.tar.enc &&
    cat image.jpg archive.zip > $1.jpg &&
    rm $1.tar.enc image.jpg archive.zip
}

decrypt-hidden () {
    unzip $1
    decrypt-dir $(basename $1 .jpg).tar.enc &&
    rm $(basename $1 .jpg).tar.enc
}

gsta() {
    git remote add -f $1 $2
    git subtree add --prefix $1 $1
}

gstl() {
    git subtree pull --prefix $1 $1
}

gstp() {
    git subtree push --prefix $1 $1 master
}

# gsts() {
#     git subtree split --prefix=$1 --annotate="(split)" -b $1
# }

gstc() {
    git remote add $1 $2
}

git-remove-from-history() {
    git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all &&
    rm -rf .git/refs/original/ &&
    git reflog expire --expire=now --all &&
    git gc --prune=now &&
    git gc --aggressive --prune=now
}

c () {
    local prev=$PWD
    [[ -d "$@" ]] && cd "$@" || z "$@"
    [[ $PWD != $prev ]] && ls -a
}
