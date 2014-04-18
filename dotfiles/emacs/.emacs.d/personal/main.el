;;; Main
;;; ====

;;; Require packages
;;; ----------------

(prelude-ensure-module-deps '(
                              dired+
                              dired-details
                              edit-server
                              fill-column-indicator
                              floobits
                              git-gutter-fringe
                              graphviz-dot-mode
                              highlight-indentation
                              hide-comnt
                              ido-vertical-mode
                              inflections
                              multiple-cursors
                              powerline
                              rspec-mode
                              rinari
                              robe
                              skewer-mode
                              visual-regexp
                              visual-regexp-steroids
                              yaml-mode
                              rvm
                              unfill
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

;;; Start server(legacy)
;;; --------------------

(server-start)

;;; Require packages
;;; ----------------

(require 'sr-speedbar)
(require 'inflections)
(require 'visual-regexp-steroids)
(require 'dired-details)

;;; Global modes
;;; ------------

(global-whitespace-mode t)
(global-git-gutter-mode t)
(global-rainbow-delimiters-mode)
(global-fci-mode t)
(global-highlight-indentation-mode t)
(yas-global-mode 1)

;;; Configure Global
;;; ----------------

(ido-vertical-mode 1)

(setq fci-rule-column 80)
(setq flycheck-display-errors-delay 0)
