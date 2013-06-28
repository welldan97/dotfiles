;; Navigation between windows
(global-set-key (kbd "C-S-n") 'windmove-down)
(global-set-key (kbd "C-S-p") 'windmove-up)
(global-set-key (kbd "C-S-b") 'windmove-left)
(global-set-key (kbd "C-S-f") 'windmove-right)

;; Duplicate line or region
(global-set-key (kbd "C-S-d") 'prelude-duplicate-current-line-or-region)

;; Move text
(global-set-key (kbd "M-N") 'prelude-move-line-down)
(global-set-key (kbd "M-P") 'prelude-move-line-up)

;; Replace regexp
(global-set-key (kbd "C-%") 'replace-regexp)

;; Speedbar
(global-set-key (kbd "C-c C-s") 'sr-speedbar-toggle)

;; Delete with h key
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Comment or uncomment region or line
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

;; Revert buffer
(global-set-key (kbd "C-c C-g") 'revert-buffer)

;; Create temporary buffer
(global-set-key (kbd "C-c C-t") 'create-new-temporary-buffer)

;; Flyspell
(global-set-key (kbd "C-$") 'flyspell-auto-correct-previous-word)

;; Multiple line edit

(global-set-key (kbd "C-c m") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") ' mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "M-SPC") 'set-rectangular-region-anchor)

;; Helm
(global-set-key (kbd "M-X") 'helm-prelude)
