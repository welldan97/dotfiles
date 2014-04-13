master_char='🗻'
improvement_char='🌀'
bug_char='🐛'
experiment_char='🎇'
documentation_char='📓'
feature_char='💡'

emojify-master() {
    sed "s/master/$master_char  /"
}

emojify-git-dir() {
    sed "s/$1\//$(eval-var \"\$${1}_char\")  /"
}

emojify-prompt() {
  git_prompt_info |
  emojify-git-dir bug |
  emojify-git-dir documentation |
  emojify-git-dir experiment |
  emojify-git-dir feature |
  emojify-git-dir improvement |
  emojify-master
}


PROMPT='%3~%{$fg[blue]%}$(emojify-prompt)%{$fg[default]%} \$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
