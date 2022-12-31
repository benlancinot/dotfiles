;; module-lang-c.el
;; Author: Benjamin Lancinot

;; Simple C IDE

(use-package cc-mode
  :ensure t
  :config
  (add-hook 'c-mode-hook #'ggtags-mode)
  (add-hook 'c++-mode-hook #'ggtags-mode)
  (setq-default c-basic-offset 2)
  (setq c-default-style "linux")
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(use-package semantic
  :ensure t
  :init
  (semantic-mode 1))


;; function-args
(use-package function-args
  :ensure t
  :after (swiper cc-mode)
  :bind (:map c-mode-map
         ("C-c <tab>" . moo-complete)
         ("C-c j" . moo-jump-local)
         :map c++-mode-map
         ("C-c <tab>" . moo-complete)
         ("C-c j" . moo-jump-local)))

(setq
 gdb-many-windows t
 gdb-show-main t)

;; Irony
(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode))


(provide 'module-lang-c)
