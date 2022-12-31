;;; core-bootstrap.el
;; Author: Benjamin Lancinot

;; Gestion de l'installation des packages
;; Gestion des dépots
(require 'package)

;; Dépots à utiliser
(setq package-archives '(("gnu"      . "http://elpa.gnu.org/packages/")
                         ("melpa"    . "http://melpa.org/packages/")))

;; Tous les packages nécessaires
(defconst my-packages
  '(use-package
     hydra
     ivy
     swiper
     counsel
     counsel-projectile
     all-the-icons-ivy-rich
     ivy-rich
     prescient
     ivy-prescient
     smex
     flymd
     projectile
     ace-window
     ggtags
     clean-aindent-mode
     comment-dwim-2
     dtrt-indent
     ws-butler
     yasnippet
     multiple-cursors
     undo-tree
     flycheck
     neotree
     exec-path-from-shell
     eglot
     company
     company-go
     doom-themes
     doom-modeline
     markdown-mode
     yaml-mode
     js2-mode
     typescript-mode
     web-mode
     go-mode
     go-add-tags
     centaur-tabs))

;; Installe les packages s'ils ne le sont pas
(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

(provide 'core-bootstrap)
