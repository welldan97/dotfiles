;; Needed for Starter Kit installation

(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-ruby
                      starter-kit-lisp

                      coffee-mode
                      haml-mode
                      haskell-mode
                      markdown-mode
                      move-text
                      sass-mode
                      slim-mode
                      yaml-mode

                      git-gutter
                      fill-column-indicator
                      flycheck
                      lorem-ipsum
                      rainbow-mode
                      smartparens
                      undo-tree
                      whole-line-or-region

                      projectile
                      helm
                      helm-projectile
                      yasnippet
                      yasnippet-bundle
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load welldan97 files if Starter Kit didn't load it
(when (not (eq user-login-name "welldan97"))
  (load
   (concat user-emacs-directory "welldan97.el"))
  (mapc 'load (directory-files
               (concat user-emacs-directory "welldan97")
               t "^[^#].*el$"))

  )

;; Delete backwards on C-h
;; For some reason it conflicts if written in keybindings file
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Sorry I'll put this here again, because of the bugs
(global-git-gutter-mode t)
