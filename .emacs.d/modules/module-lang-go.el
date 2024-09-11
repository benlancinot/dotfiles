;; module-lang-go.el
;; Author: Benjamin Lancinot

(use-package go-mode
    :config
    (add-hook 'before-save-hook 'gofmt-before-save))


(provide 'module-lang-go)
