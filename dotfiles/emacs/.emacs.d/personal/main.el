(prelude-ensure-module-deps '(
                              edit-server
                              fill-column-indicator
                              git-gutter-fringe
                              ))
(mapc 'load
      (directory-files
       (concat prelude-personal-dir "/patches")
       t "^[^#].*el$"))

(disable-theme 'zenburn)

(server-start)

(require 'multiple-line-edit)
(require 'sr-speedbar)

(chrome-edit-with-emacs)
(customize-speedbar)
(global-fci-mode t)
(global-git-gutter-mode t)
