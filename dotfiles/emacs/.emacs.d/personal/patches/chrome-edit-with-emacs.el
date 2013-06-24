(defun chrome-edit-with-emacs ()
  "Enable editing with emacs"
  (when (require 'edit-server nil t)
    (setq edit-server-new-frame nil)
    (edit-server-start))
  )
