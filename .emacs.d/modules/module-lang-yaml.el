;; module-lang-yaml.el
;; Author: Benjamin Lancinot
;; YAML management

(use-package yaml-mode
  :commands yaml-mode
  :config
    (add-to-list 'auto-mode-alist '("\\.yml\\'"  . yaml-mode))
    (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
    (add-hook 'yaml-mode-hook
              (lambda ()
                (define-key yaml-mode-map (kbd "<return>") #'newline-and-indent))))

(provide 'module-lang-yaml)
