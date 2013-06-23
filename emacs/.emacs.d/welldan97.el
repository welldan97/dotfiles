;; Load plugins
(mapc 'load
      (directory-files
       (concat user-emacs-directory "welldan97/plugins")
                       t "^[^#].*el$"))

;; One instance of Emacs
(server-start)

;; Edit with emacs in chrome
(when (require 'edit-server nil t)
  (setq edit-server-new-frame nil)
  (edit-server-start))

;; Delete selected text when write to buffer
(delete-selection-mode)

;; Operate with current line if no region selected
(whole-line-or-region-mode)

;; Snippets
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)

;; Speedbar
(setq speedbar-use-images nil)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files t)
(setq speedbar-directory-unshown-regexp "^\\.\\.")

;; Projectile
(projectile-global-mode)

;; Lorem
(require 'lorem-ipsum)
