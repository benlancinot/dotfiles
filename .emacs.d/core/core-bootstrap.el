;;; core-bootstrap.el
;; Author: Benjamin Lancinot

;; Gestion de l'installation des packages

;; Gestion des dépots
;; https://github.com/radian-software/straight.el
(setq package-enable-at-startup nil)

(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name
       "straight/repos/straight.el/bootstrap.el"
       (or (bound-and-true-p straight-base-dir)
           user-emacs-directory)))
     (bootstrap-version 7))
 (unless (file-exists-p bootstrap-file)
   (with-current-buffer
       (url-retrieve-synchronously
        "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
     (goto-char (point-max))
     (eval-print-last-sexp)))
 (load bootstrap-file nil 'nomessage))

(setq straight-vc-git-default-clone-depth 1)
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq straight-check-for-modifications '(check-on-save find-when-checking))


;; (use-package package
;;   :demand t
;;   :preface
;;   (setopt package-quickstart nil)
;;   :config
;;   (defvar package-archives)
;;   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;   (package-initialize))

;; Tous les packages nécessaires
;; (defconst my-packages
;;   '( use-package
;;      autothemer
;;      paradox
;;      ivy
;;      swiper
;;      counsel
;;      counsel-projectile
;;      all-the-icons-ivy-rich
;;      ivy-rich
;;      prescient
;;      ivy-prescient
;;      smex
;;      projectile
;;      ace-window
;;      ggtags
;;      clean-aindent-mode
;;      comment-dwim-2
;;      dtrt-indent
;;      ws-butler
;;      undo-tree
;;      neotree
;;      exec-path-from-shell
;;      emojify
;;      company
;;      doom-themes
;;      doom-modeline
;;      markdown-mode
;;      yaml-mode
;;      go-mode
;;      go-add-tags
;;      centaur-tabs
;;      ))

;; ;; Installe les packages s'ils ne le sont pas
;; (defun install-packages ()
;;   "Install all required packages."
;;   (interactive)
;;   (unless package-archive-contents
;;     (package-refresh-contents))
;;   (dolist (package my-packages)
;;     (unless (package-installed-p package)
;;       (package-install package))))

;; (install-packages)

(provide 'core-bootstrap)
