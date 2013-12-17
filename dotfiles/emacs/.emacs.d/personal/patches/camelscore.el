(defun split-name (s)
  (split-string
   (let ((case-fold-search nil))
     (downcase
      (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s)))
   "[^A-Za-z0-9]+"))

;; TODO: pascalcase
(defun camelcase     (s) (mapconcat 'capitalize (split-name s) ""))
(defun underscore    (s) (mapconcat 'downcase   (split-name s) "_"))
(defun dasherize     (s) (mapconcat 'downcase   (split-name s) "-"))
(defun colonize      (s) (mapconcat 'capitalize (split-name s) "::"))
(defun constantize   (s) (mapconcat 'upcase (split-name s) "_"))

(defun camelscore (s)
  (cond ((string-match-p "\\(?:[a-z]+_\\)+[a-z]+" s)        (dasherize  s))
        ((string-match-p "\\(?:[a-z]+-\\)+[a-z]+" s)        (camelcase  s))
        ((string-match-p "\\(?:[A-Z][a-z]+\\)+$"  s)        (constantize   s))
        (t                                                  (underscore s)) ))

(defun camelscore-word-at-point ()
  (interactive)
  (let* ((case-fold-search nil)
         (beg (and (skip-chars-backward "[:alnum:]:_-") (point)))
         (end (and (skip-chars-forward  "[:alnum:]:_-") (point)))
         (txt (buffer-substring beg end))
         (cml (camelscore txt)) )
    (if cml (progn (delete-region beg end) (insert cml))) ))
