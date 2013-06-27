(setq fci-rule-column 80)

(define-globalized-minor-mode
  global-fci-mode
  fci-mode
  (lambda ()
    (fci-mode t)))
