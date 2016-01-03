(defun powerline-welldan97-theme ()
  "Setup a nano-like personal mode-line."
  (interactive)
  (setq-default mode-line-format
		'("%e"
		  (:eval
		   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
			  (lhs (list
                                (powerline-raw " ")
                                (powerline-major-mode)))
			  (rhs (list
                                (powerline-raw "%4l")
                                (powerline-raw ":")
                                (powerline-raw "%3c")
                                (powerline-raw "  ")))
			  (center (list (powerline-raw "%b" nil))))
		     (concat (powerline-render lhs)
			     (powerline-fill-center nil (/ (powerline-width center) 2.0))
			     (powerline-render center)
			     (powerline-fill nil (powerline-width rhs))
			     (powerline-render rhs)))))))
