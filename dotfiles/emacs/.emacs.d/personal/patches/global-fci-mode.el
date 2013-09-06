(setq fci-rule-column 79)

(define-globalized-minor-mode
  global-fci-mode
  fci-mode
  (lambda ()
    (fci-mode t)))
