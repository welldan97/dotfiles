typeset -gAH git_branch_emoji_char

git_branch_emoji_char[master]=mount_fuji

git-branch-emoji() {
  current_branch=$(git-current-branch)
  if [ "$?" = "0" ]; then
    if [ "$current_branch" = "master" ]; then
      echo $emoji[$git_branch_emoji_char[master]]'  '
    else
      echo "$(identemoji $(git-current-branch))  "
    fi
  fi
}
