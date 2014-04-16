;; Navigation between frames
(global-set-key (kbd "<C-tab>") 'ns-prev-frame)

;; Delete with h key
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Navigation between windows
(global-set-key (kbd "H-N") 'windmove-down)
(global-set-key (kbd "H-P") 'windmove-up)
(global-set-key (kbd "H-B") 'windmove-left)
(global-set-key (kbd "H-F") 'windmove-right)

;; Duplicate line or region
(global-set-key (kbd "H-d") 'prelude-duplicate-current-line-or-region)

;; Move text
(global-set-key (kbd "H-n") 'move-text-down)
(global-set-key (kbd "H-p") 'move-text-up)

;; Replace regexp
(global-set-key (kbd "H-&") 'replace-regexp)

;; Comment or uncomment region or line
(global-set-key (kbd "H-;") 'comment-or-uncomment-region-or-line)

;; Revert buffer
(global-set-key (kbd "H-g") 'revert-buffer)

;; Create temporary buffer
(global-set-key (kbd "H-t") 'create-new-temporary-buffer)

;; Flyspell
(global-set-key (kbd "H-$") 'flyspell-auto-correct-previous-word)

;; Multiple line edit

(global-set-key (kbd "H-c m") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "H-.") 'mc/mark-next-like-this)
(global-set-key (kbd "H-,") ' mc/mark-previous-like-this)
(global-set-key (kbd "H-:") 'mc/mark-all-like-this)

(global-set-key (kbd "H-SPC") 'set-rectangular-region-anchor)

;; Copy file name to clipboard
(global-set-key (kbd "H-c n") 'prelude-copy-file-name-to-clipboard)
;; Jump to file
(global-set-key (kbd "H-j") 'dired-jump)

;; Inflections
(global-set-key (kbd "H-i") 'camelscore-word-at-point)
(global-set-key (kbd "H-s") 'singularize-or-pluralize)

;; Increment/decrement
(global-set-key (kbd "H-+") 'increment-number)
(global-set-key (kbd "H--") 'decrement-number)

;; Toggle fold
(global-set-key (kbd "H-=") 'toggle-fold)

;; Prelude mapping
(global-set-key (kbd "H-m m") 'magit-status)
(global-set-key (kbd "H-m l") 'magit-log)
(global-set-key (kbd "H-m f") 'magit-file-log)
(global-set-key (kbd "H-m b") 'magit-blame)

(getlobal-set-key (kbd "H-r") 'projectile-find-file)
(global-set-key (kbd "H-R") 'projectile-find-dir)

;; Speedbar
(global-set-key (kbd "H-c s") 'sr-speedbar-toggle)

;; Helm
(global-set-key (kbd "H-x") 'helm-prelude)
