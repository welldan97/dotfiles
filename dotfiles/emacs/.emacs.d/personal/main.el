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
                              fill-column-indicator
                              floobits
                              git-gutter-fringe
                              graphviz-dot-mode
                              highlight-indentation
                              hide-comnt
                              ido-vertical-mode
                              inflections
                              iy-go-to-char
                              jade-mode
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
                              web-beautify
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
(require 'midnight)

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
(set-tab-stop-list 2)

;;; Close unused buffers every 15 minutes
(run-at-time 0 900 'clean-buffer-list)
