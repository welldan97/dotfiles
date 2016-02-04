;;; Main
;;; ====

;;; Require packages
;;; ----------------

(prelude-ensure-module-deps '(
                              dired+
                              dired-details
                              edit-server
                              editorconfig
                              ess
                              evil-dvorak
                              fill-column-indicator
                              floobits
                              git-gutter-fringe
                              graphviz-dot-mode
                              hide-comnt
                              highlight-indentation
                              ido-vertical-mode
                              inflections
                              iy-go-to-char
                              jade-mode
                              markdown-mode
                              multiple-cursors
                              powerline
                              rinari
                              robe
                              rspec-mode
                              rvm
                              skewer-mode
                              slim-mode
                              unfill
                              visual-regexp
                              visual-regexp-steroids
                              web-beautify
                              yaml-mode
                              ))

;;; Configure Prelude
;;; -----------------

(disable-theme 'zenburn)
(setq prelude-guru nil)

;;; Load patches
;;; ------------

(mapc 'load
      (directory-files
       (concat prelude-personal-dir "/patches")
       t "^[^#].*el$"))

;;; Require packages
;;; ----------------

;;(require 'sr-speedbar)
(require 'dired-details)
(require 'inflections)
(require 'midnight)
(require 'powerline)
(require 'visual-regexp-steroids)

;;; Global modes
;;; ------------

(global-whitespace-mode t)
(global-git-gutter-mode t)
(global-rainbow-delimiters-mode t)
(global-fci-mode t)
(global-highlight-indentation-mode t)
(yas-global-mode 1)

;;; Configure Global
;;; ----------------

(ido-vertical-mode 1)

(setq fci-rule-column 80)
(setq flycheck-display-errors-delay 0)
(set-tab-stop-list 2)

(powerline-welldan97-theme)

;;; Helm fuzzy match
(setq helm-M-x-fuzzy-match t)
(setq helm-recentf-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-locate-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-lisp-completion-at-point t)
(setq helm-mode-fuzzy-match t)

;; helm-recentf-fuzzy-match var is broken: redeclare it manually
;; http://emacs.stackexchange.com/a/14257/137
(setq helm-source-recentf
      (helm-make-source "Recentf" 'helm-recentf-source
        :fuzzy-match t))

;;; Open with emacs in same frame
(setq ns-pop-up-frames nil)

;;; Emacs title format
(setq frame-title-format '("" "%b - Emacs"))

;;; Close unused buffers every 15 minutes
(run-at-time 0 900 'clean-buffer-list)

;;; Start server(legacy)
;;; --------------------

(server-start)
