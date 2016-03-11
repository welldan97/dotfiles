(define-globalized-minor-mode
  global-whitespace-mode
  whitespace-mode
  (lambda ()
    (set-face-background 'whitespace-line "#ffbbbb")
    (set-face-foreground'whitespace-line "#000000")
    (whitespace-mode t)))
