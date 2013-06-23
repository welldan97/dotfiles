(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

(defun var-font ()
  "set text font"
  (interactive)
  (variable-pitch-mode t)
  (setq line-spacing 5)
  )
