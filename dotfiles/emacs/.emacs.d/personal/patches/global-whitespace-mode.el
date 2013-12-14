(setq fci-rule-column 79)

(define-globalized-minor-mode
  global-whitespace-mode
  fci-mode
  (lambda ()
    (whitespace-mode t)))
