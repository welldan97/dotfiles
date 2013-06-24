(defun customize-speedbar ()
  "Apply preferences to speedbar and sr-speedbar"
  (setq speedbar-use-images nil)
  (setq sr-speedbar-right-side nil)
  (setq speedbar-show-unknown-files t)
  (setq speedbar-directory-unshown-regexp "^\\.\\."))
