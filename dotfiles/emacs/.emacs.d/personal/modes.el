;;; Modes
;;; =====

;;; Mail
;;; ----

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

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
(setq-default js2-basic-offset 2)
(setq coffee-tab-width 2)

(setq-default js2-global-externs '("module"
                                   "require"
                                   "__dirname"
                                   "process"
                                   "Buffer"
                                   "describe"
                                   "it"
                                   "beforeEach"
                                   "console"
                                   "JSON"))

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

;;; ASM
;;; ---

(eval-after-load "asm-mode"
  '(progn
     (define-key asm-mode-map (kbd "<tab>") 'tab-to-tab-stop)))

;;; Prolog
;;; ------

(add-to-list 'auto-mode-alist '("\\.\\(pl\\|pro\\|lgt\\)" . prolog-mode))

;;; Slim & Emblem
;;; --------

(setq auto-mode-alist
      (cons '("\\.em\\'" . slim-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.emblem\\'" . slim-mode) auto-mode-alist))

;;; Dired
;;; -----

(toggle-diredp-find-file-reuse-dir 1)
(dired-details-install)
(setq dired-details-hidden-string "")

;;; Shell
;;; -----

;;; Disable shellcheck errors

(setenv "SHELLCHECK_OPTS" "-e SC2119 -e SC2002")
