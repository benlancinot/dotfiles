;;; core-ui.el
;; Author: Benjamin Lancinot

;; Gestion de l'affichage en général, buffer, fenètres, paramètrage, barre.

;; Désactive menu-bar, tool-bar et scroll-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Désactive scintillement du curseur
(blink-cursor-mode -1)

;; yes -> y, no -> n
(fset 'yes-or-no-p 'y-or-n-p)

(setq gc-cons-threshold 100000000)

;; Désactive startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Désactive ring-bell
(setq ring-bell-function 'ignore) ; disable the annoying bell ring

;; Scrolling plus sympa
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Overwrite selected region when typing
(delete-selection-mode 1)

;; Active affichage colonnes et lignes
(line-number-mode t)
(column-number-mode t)

;; Paramètres d'indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indicate-empty-lines nil)

;; UTF8 only
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; whitespace clean-up
;; (add-hook 'before-save-hook 'whitespace-cleanup)

;; Fenètre automatiquement dimensionnée au démarrage en demi-écran
(when window-system (set-frame-size (selected-frame) 115 60))

;; Ne tronque pas les mots
(setq truncate-partial-width-windows nil)

;; Surligne la ligne courante
(global-hl-line-mode 1)

;; Affiche les espaces inutiles
;; (add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; Startup screen
(use-package dashboard
  :ensure t
  :diminish (dashboard-mode page-break-lines-mode)
  :functions (dashboard-insert-startupify-lists widget-forward)
  :config

  (setq dashboard-items '((recents  . 3)
                          (bookmarks . 8)
                          (projects . 8)))

  ;; Banner
  (setq dashboard-startup-banner 'logo)

  ;; Set the title
  (setq dashboard-banner-logo-title "Happy Hacking.")

  ;; Display loaded package + start time
  (setq dashboard-set-init-info t)

  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)

  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)

  ;; Icons
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)

  ;; Navigator
  (setq dashboard-set-navigator t)

  ;; Useless msg
  (setq dashboard-set-footer nil)

  (dashboard-setup-startup-hook))


;; Charge le theme : zenburn
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-enable-bright-minibuffer t
      doom-enable-bright-buffers t)

;; Load the theme
;;(load-theme 'doom-opera t)
(use-package autothemer
  :config
   (load-theme 'catppuccin-frappe t)
)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; neotree
(use-package all-the-icons)

(doom-themes-neotree-config)
(setq doom-themes-neotree-file-icons t)

(setq doom-neotree-line-spacing 1)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(setq doom-neotree-line-spacing 1)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; all-the-icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; all-the-icons in ivy
(use-package all-the-icons-ivy
  :ensure t
  :config
  (all-the-icons-ivy-setup))

;;(setq all-the-icons-ivy-buffer-commands '())
(setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(setq doom-modeline-buffer-file-name-style 'truncate-all)

;; Whether show `all-the-icons' or not (if nil nothing will be showed).
;; The icons may not be showed correctly on Windows. Disable to make it work.
(setq doom-modeline-icon (display-graphic-p))

;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon nil)

;; Whether display minor modes or not. Non-nil to display in mode-line.
(setq doom-modeline-minor-modes nil)

;; Whether display perspective name or not. Non-nil to display in mode-line.
(setq doom-modeline-persp-name t)

;; Whether display `lsp' state or not. Non-nil to display in mode-line.
(setq doom-modeline-lsp t)

;; Whether display github notifications or not. Requires `ghub` package.
(setq doom-modeline-github nil)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-plain-icons t)
  (setq centaur-tabs-height 18)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-style "rounded")
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(provide 'core-ui)
