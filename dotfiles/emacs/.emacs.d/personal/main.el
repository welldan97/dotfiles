(prelude-ensure-module-deps '(
                              edit-server
                              fill-column-indicator
                              git-gutter-fringe
                              multiple-cursors
                              skewer-mode
                              yaml-mode
                              ))
(mapc 'load
      (directory-files
       (concat prelude-personal-dir "/patches")
       t "^[^#].*el$"))

(disable-theme 'zenburn)

(server-start)

(require 'sr-speedbar)

(global-fci-mode t)
(global-git-gutter-mode t)
(global-rainbow-delimiters-mode)

;;; Modes
;;; =====

;;; ## Markdown

(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))


;;; ## SASS

(add-hook 'sass-mode-hook (lambda () (rainbow-mode t)))