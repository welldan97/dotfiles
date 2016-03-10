(define-globalized-minor-mode
  global-highlight-indentation-mode
  highlight-indentation-mode
  (lambda ()
    (set (make-local-variable 'highlight-indentation-offset) 2)
    (highlight-indentation-mode)
    (highlight-indentation-current-column-mode)
    (set-face-background 'highlight-indentation-current-column-face "#aaaaff")
    (set-face-background 'highlight-indentation-face "#eeeeff")))
