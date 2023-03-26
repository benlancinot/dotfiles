;;; init.el
;; Author: Benjamin Lancinot

(package-initialize)

(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Powering up... Be patient, Master %s!" current-user)

(defvar emacs-dir (file-name-directory "~/.emacs.d/init.el")
  "The root dir of the Emacs distribution.")

(defvar core-dir (expand-file-name "core" emacs-dir)
  "The home of core functionality.")

(defvar modules-dir (expand-file-name "modules" emacs-dir)
  "This directory houses all of the modules.")

(defvar themes-dir (expand-file-name "themes" emacs-dir)
  "This directory houses all of the themes.")

(defvar persistent-dir (expand-file-name "persistent" emacs-dir)
  "This directory houses packages that are not yet available in ELPA (or MELPA).")

(unless (file-exists-p persistent-dir)
  (make-directory persistent-dir))

(add-to-list 'load-path themes-dir)
(add-to-list 'custom-theme-load-path themes-dir)
(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)


(message "Loading core...")
(require 'core-bootstrap)
(require 'core-ui)
(require 'core-paths)
(require 'core-packages)
(require 'core-utils)
(require 'core-binding)

(message "Loading modules...")
;;(require 'module-lang-tex)
;; (require 'module-lang-c)
(require 'module-lang-go)
;; (require 'module-lang-javascript)
(require 'module-lang-markdown)
(require 'module-lang-yaml)

(require 'paradox)
(paradox-enable)

(message "Ready to do thy bidding, Master %s!" current-user)

(add-to-list 'display-buffer-alist '("*Buffer List*" . display-buffer-same-window))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(emojify spaceline-all-the-icons all-the-icons-gnus all-the-icons-ibuffer treemacs-all-the-icons string-inflection cl-lib org-superstar centaur-tabs tabbar yasnippet yaml-mode ws-butler web-mode use-package undo-tree terraform-mode smex protobuf-mode paradox neotree multiple-cursors magit-section js2-mode ivy-prescient go-add-tags git-commit ggtags flymd exec-path-from-shell dtrt-indent doom-themes dashboard counsel-projectile company-go comment-dwim-2 clean-aindent-mode autothemer all-the-icons-ivy-rich all-the-icons-ivy all-the-icons-dired ace-window))
 '(paradox-automatically-star t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
