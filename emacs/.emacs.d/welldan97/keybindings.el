;; Switch buffers
(global-set-key (kbd "M-p") 'previous-buffer)
(global-set-key (kbd "M-n") 'next-buffer)

;; Navigation between windows
(global-set-key (kbd "C-S-n") 'windmove-down)
(global-set-key (kbd "C-S-p") 'windmove-up)
(global-set-key (kbd "C-S-b") 'windmove-left)
(global-set-key (kbd "C-S-f") 'windmove-right)

;; Replace regexp
(global-set-key (kbd "C-%") 'replace-regexp)

;; Move text
(global-set-key (kbd "M-N") 'move-text-down)
(global-set-key (kbd "M-P") 'move-text-up)

;; Duplicate line
(global-set-key (kbd "C-S-d") 'duplicate-current-line)

;; Multiple line edit
(global-set-key (kbd "C-S-a") 'mulled/edit-leading-edges)
(global-set-key (kbd "C-S-e") 'mulled/edit-trailing-edges)

;; Helm
(global-set-key (kbd "C-c h") 'helm-mini)
