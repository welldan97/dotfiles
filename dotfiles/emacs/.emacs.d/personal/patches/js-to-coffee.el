(defun js-to-coffee ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "js2coffee" (buffer-name) t)
    ))
