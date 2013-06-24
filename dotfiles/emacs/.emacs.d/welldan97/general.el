;; Function for simpler emacs configuration reloading
(defun reload-emacs ()
  "Reload emacs configuration stored in ~/.emacs.d/init.el"
  (interactive)
  (load-file "~/.emacs.d/init.el")
  )

;; Comment line or region
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))

