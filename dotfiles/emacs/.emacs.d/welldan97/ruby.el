(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))

;; delete trailing whitespace on save

(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      (lambda()
                        (save-excursion
                          (delete-trailing-whitespace))))))
