;; Clean default keys
(setq term-bind-key-alist '())

;; Keys that delegated to emacs
(setq term-unbind-key-list
      '("C-x" "C-y" "M-/" "M-x" "M-RET"))

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode ))
