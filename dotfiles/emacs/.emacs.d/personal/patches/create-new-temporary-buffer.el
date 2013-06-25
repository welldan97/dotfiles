(defun create-new-temporary-buffer (mode)
  "Create a temporary buffer"
  (interactive "sGlobal mode: ")
  (progn
    (let (buffer-name mode-eval)
      (if (string= "" mode)
          (progn
            (setq buffer-name "*temp*")
            (setq mode-eval "(text-mode)"))
        (progn
          (setq buffer-name (concat "*" mode " temp*"))
          (setq mode-eval (concat "(" mode "-mode)"))
          ))
      (switch-to-buffer
       (get-buffer-create
        (generate-new-buffer-name buffer-name)))
      (eval (read mode-eval)))))
