(prelude-ensure-module-deps '(
                              edit-server
                              ))
(mapc 'load
      (directory-files
       (concat prelude-personal-dir "/patches")
       t "^[^#].*el$"))

(disable-theme 'zenburn)

(server-start)

(require 'multiple-line-edit)

(chrome-edit-with-emacs)
