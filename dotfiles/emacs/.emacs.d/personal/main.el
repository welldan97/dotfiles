;;; Main
;;; ====

;;; Require packages
;;; ----------------

(prelude-ensure-module-deps '(
                              ag
                              dired+
                              dired-details
                              edit-server
                              editorconfig
                              eslint-fix
                              ess
                              evil-dvorak
                              fill-column-indicator
                              floobits
                              flymake-css
                              git-gutter-fringe
                              graphviz-dot-mode
                              hide-comnt
                              highlight-indentation
                              ido-vertical-mode
                              inflections
                              iy-go-to-char
                              jade-mode
                              jsx-mode
                              markdown-mode
                              multiple-cursors
                              nvm
                              powerline
                              restclient
                              rinari
                              robe
                              rspec-mode
                              rvm
                              skewer-mode
                              slim-mode
                              tide
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

;; (global-whitespace-mode t)
(global-git-gutter-mode t)
(global-rainbow-delimiters-mode t)
(global-fci-mode t)
(global-highlight-indentation-mode t)
(yas-global-mode 1)

;;; Configure Global
;;; ----------------
;; backup dir for temp files
(setq backup-directory-alist `(("." . "~/.saves")))
(ido-vertical-mode 1)
;; for M-q
(setq-default fill-column 80)
(setq fci-rule-column 80)
(setq flycheck-display-errors-delay 0)
(set-tab-stop-list 2)
;; bigger line height
(setq-default line-spacing 3)
(powerline-welldan97-theme)

(setenv "PATH" (concat  ":/opt/boxen/nodenv/shims/" (getenv "PATH")))
(setenv "PATH" (concat  (getenv "PATH") ":/opt/boxen/nodenv/shims/" ))
;;; Helm stops creating dirs and renaming files, so disable it
(setq jedcn-env-path "/opt/boxen/rbenv/shims:/opt/boxen/nodenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/usr/local/share/npm/bin")

(defun jedcn-sync-env-path-and-exec-path (desired-path)
  "Sets exec-path and env 'PATH' based on DESIRED-PATH"
  (setenv "PATH" desired-path)
  (setq exec-path (split-string desired-path ":")))

(jedcn-sync-env-path-and-exec-path jedcn-env-path)
(helm-mode 0)

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
;; (setq helm-source-recentf
;;       (helm-make-source "Recentf" 'helm-recentf-source
;;         :fuzzy-match t))

;;; Open with emacs in same frame
(setq ns-pop-up-frames nil)

;;; Emacs title format
(setq frame-title-format '("" "%b - Emacs"))

;;; Close unused buffers every 15 minutes
(run-at-time 0 900 'clean-buffer-list)

;; Faster Undo Tree
(setq undo-tree-visualizer-lazy-drawing 5)

;;; Start server(legacy)
;;; --------------------

(server-start)
