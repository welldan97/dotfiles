(defun set-tab-stop-list (indent)
  (custom-set-variables
   '(tab-stop-list
     (let (arr i)
       (setq i 0)
       (setq arr (make-vector 20 0))
       (mapcar
        (lambda(x) (progn (setq i (+ i indent))))
        arr))))  )
