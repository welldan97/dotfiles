(prelude-ensure-module-deps '(
                              dired+
                              dired-details
                              edit-server
                              fill-column-indicator
                              floobits
                              git-gutter-fringe
                              graphviz-dot-mode
                              highlight-indentation
                              ido-vertical-mode
                              inflections
                              multiple-cursors
                              powerline
                              rspec-mode
                              rinari
                              robe
                              skewer-mode
                              yaml-mode
                              rvm
                              unfill
                              ))
(mapc 'load
      (directory-files
       (concat prelude-personal-dir "/patches")
       t "^[^#].*el$"))

(disable-theme 'zenburn)
(setq prelude-guru nil)

;;; HACK: http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
(eval-after-load "prelude-mode"
  '(define-key prelude-mode-map (kbd "s-p") nil))
(eval-after-load "prelude-mode"
  '(define-key prelude-mode-map (kbd "s-d") nil))

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

(setq flycheck-display-errors-delay 0)

(setq ns-function-modifier 'super)

(ido-vertical-mode 1)

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

(rvm-use-default)
(setq ruby-insert-encoding-magic-comment nil)

;;; Shell
;;; -----

(setq sh-basic-offset 2)
(setq sh-indentation 2)
(add-hook 'ruby-mode-hook 'robe-mode)
(push 'company-robe company-backends)


;;; Dired
;;; -----

(toggle-diredp-find-file-reuse-dir 1)
(require 'dired-details)
(dired-details-install)
(setq dired-details-hidden-string "")
