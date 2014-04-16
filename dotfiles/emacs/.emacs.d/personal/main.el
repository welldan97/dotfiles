(prelude-ensure-module-deps '(
                              dired-details
                              graphviz-dot-mode
                              edit-server
                              fill-column-indicator
                              floobits
                              git-gutter-fringe
                              highlight-indentation
                              inflections
                              multiple-cursors
                              rspec-mode
                              rinari
                              skewer-mode
                              yaml-mode
                              unfill
                              ))
(mapc 'load
      (directory-files
       (concat prelude-personal-dir "/patches")
       t "^[^#].*el$"))

(disable-theme 'zenburn)
(setq prelude-guru nil)

(server-start)

(require 'sr-speedbar)
(require 'inflections)

(global-whitespace-mode t)
(global-git-gutter-mode t)
(global-rainbow-delimiters-mode)
(yas-global-mode 1)

(setq fci-rule-column 80)
(global-fci-mode t)
(global-highlight-indentation-mode t)
(ido-mode)

(setq flycheck-display-errors-delay 0)

;;; HACK: Move away from here
(require 'dired-details)
(dired-details-install)
(setq dired-details-hidden-string "")

;;; Modes
;;; =====

;;; Markdown
;;; --------

(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;; SASS
;;; ----

(add-hook 'sass-mode-hook (lambda () (rainbow-mode t)))

;;; Javascript & Coffeescript
;;; -------------------------

(setq js-indent-level 2)
(setq coffee-tab-width 2)

(add-hook 'js-mode-hook (lambda () (subword-mode t)))
(add-hook 'coffee-mode-hook (lambda () (subword-mode t)))

;;; Ruby
;;; ----

(setq ruby-insert-encoding-magic-comment nil)

;;; Shell
;;; -----

(setq sh-basic-offset 2)
(setq sh-indentation 2)
