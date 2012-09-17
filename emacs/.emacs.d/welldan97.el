;; Load plugins
(mapc 'load
      (directory-files
       (concat user-emacs-directory "welldan97/plugins")
                       t "^[^#].*el$"))

;; One instance of Emacs
(server-start)

;; Operate with current line if no region selected
(whole-line-or-region-mode)
