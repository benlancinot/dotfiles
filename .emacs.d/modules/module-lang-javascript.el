;; module-lang-javascript.el
;; Author: Benjamin Lancinot

(use-package web-mode
  :ensure t
  :init
  (company-mode +1)
  :mode ("\\.html?\\'"
         "\\.erb\\'")
  )

(use-package js2-mode
  :ensure t
  :init
  (company-mode +1)
  :mode
  (("\\.js" . js2-mode)))

(use-package typescript-mode
  :ensure t
  :init
  (company-mode +1)
  :mode (("\\.ts" . typescript-mode)
         ("\\.tsx'" . typescript-mode)))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))


(provide 'module-lang-javascript)
