bindkey '\eq' push-line-or-edit
bindkey '^[h' pb-backward-kill-word

# System Wide Clipboard

bindkey '^K'   pb-kill-line
bindkey '^U'   pb-kill-whole-line
bindkey '\e^?' pb-backward-kill-word
bindkey '\e^H' pb-backward-kill-word
bindkey '^W'   pb-backward-kill-word
bindkey '\ed'  pb-kill-word
bindkey '\eD'  pb-kill-word
bindkey '^X^K' pb-kill-buffer
bindkey '\ew'  pb-copy-region-as-kill-deactivate-mark
bindkey '\eW'  pb-copy-region-as-kill-deactivate-mark
bindkey '^Y'   pb-yank

# History substring search
bindkey -M emacs '\e^P' history-substring-search-up
bindkey -M emacs '\e^N' history-substring-search-down

# Dircycle
bindkey "^[R" insert-cycledleft
bindkey "^[S" insert-cycledright

# cd git-top
bindkey "^[T" ct
