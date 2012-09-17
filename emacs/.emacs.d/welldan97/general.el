;; Function for simpler emacs configuration reloading
(defun reload-emacs ()
  "Reload emacs configuration stored in ~/.emacs.d/init.el"
  (interactive)
  (load-file "~/.emacs.d/init.el")
  )

