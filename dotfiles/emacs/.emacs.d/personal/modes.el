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

(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map (kbd "<return>") 'newline)
     (define-key coffee-mode-map (kbd "<C-S-return>")
       '(progn
          (beginning-of-line)
          (open-line)))))

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
(dired-details-install)
(setq dired-details-hidden-string "")

;;; Org
;;; ---

;;; HACK: http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
(define-key org-mode-map (kbd "M-h") nil)