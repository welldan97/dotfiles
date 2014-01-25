git-current-branch() {
    git branch | grep '^\*' | sed 's/^\* //'
}

git-remove-from-history() {
    git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all &&
    rm -rf .git/refs/original/ &&
    git reflog expire --expire=now --all &&
    git gc --prune=now &&
    git gc --aggressive --prune=now
}
