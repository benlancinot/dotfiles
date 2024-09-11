;; core-packages.el
;; Author: Benjamin Lancinot
;; Gestion des configurations des packages installés
(use-package project)

(use-package ivy
  :diminish ivy-mode
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :config
  (ivy-mode t)

  (setq ivy-use-virtual-buffers t
        ivy-height 13
        ivy-count-format "%d/%d "
        ivy-virtual-abbreviate 'full ; Show the full virtual file paths
        ivy-extra-directories nil ; default value: ("../" "./")
        ivy-wrap t
        ivy-action-wrap t
        ivy-use-selectable-prompt t)

  ;; modify default search behaviour of ivy
  (setq ivy-re-builders-alist
        '((t . ivy--regex-plus)))

  (bind-keys
   :map ivy-occur-grep-mode-map
   ("n" . ivy-occur-next-line)
   ("p" . ivy-occur-previous-line)
   ("b" . backward-char)
   ("f" . forward-char)
   ("v" . ivy-occur-press) ; default f
   ("RET" . ivy-occur-press)))

(use-package counsel
  :after ivy
  :demand t
  :bind
  (("C-c C-r" . ivy-resume)
   ("C-x C-b" . ivy-switch-buffer)
   ("C-x C-f" . counsel-find-file)
   ("M-x"     . counsel-M-x)

   :map ivy-minibuffer-map
   ("<left>"  . ivy-backward-kill-word)
   ("<right>" . ivy-alt-done)
   ("C-f"     . ivy-partial-or-done)
   ("C-h"     . ivy-backward-kill-word)
   ("C-j"     . ivy-next-line)
   ("C-k"     . ivy-previous-line)
   ("C-l"     . ivy-alt-done)
   ("C-r"     . ivy-previous-line-or-history)

   :map counsel-find-file-map
   ("<left>"  . counsel-up-directory)
   ("C-h"     . counsel-up-directory))

   :init
   (add-to-list 'ivy-ignore-buffers "^#")
   (add-to-list 'ivy-ignore-buffers "^\\*irc\\-"))


(use-package counsel-projectile
  :after (counsel projectile)
  :diminish counsel-projectile-mode

  :preface
  (eval-when-compile
    (declare-function counsel-projectile-mode nil))

  :commands
  (counsel-projectile-rg
   counsel-projectile-find-file
   counsel-projectile-switch-project
   counsel-projectile-switch-to-buffer)

  :config
  (counsel-projectile-mode t))


(use-package ivy-prescient
  :after (ivy prescient)

  :preface
  (eval-when-compile
    (declare-function ivy-prescient-mode nil))

  :config
  (ivy-prescient-mode t))

(use-package all-the-icons-ivy-rich :defer 1
  :config
  (all-the-icons-ivy-rich-mode 1)
  (setq all-the-icons-ivy-rich-icon-size 0.8))

(use-package ivy-rich
  :after (ivy counsel)

  :preface
  (eval-when-compile
    (defvar ivy-rich-path-style)
    (declare-function ivy-rich-mode nil))

  :init
  (setq ivy-rich-path-style 'abbrev)

  :config
  (ivy-rich-mode t))

(use-package prescient
  :preface
  (eval-when-compile
    (declare-function prescient-persist-mode nil))

  :config
  (prescient-persist-mode t))


(use-package swiper
  :after ivy
  :bind (("C-s" . swiper-isearch)
         ("C-r" . query-replace))
  :config
  (setq swiper-action-recenter t
        ;; Jump to the beginning of match when leaving Swiper
        swiper-goto-start-of-match t))


;; ivy sorted via smex
(use-package smex
  :demand
  :config (setq smex-save-file (concat persistent-dir "/smex-items")))

;; Package: clean-aindent-mode
(use-package clean-aindent-mode
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode))

;; Package: dtrt-indent
(use-package dtrt-indent
  :init
  (dtrt-indent-mode 1)
  (setq dtrt-indent-verbosity 0))

;; Package: ws-butler
(use-package ws-butler
  :init
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'text-mode 'ws-butler-mode)
  (add-hook 'fundamental-mode 'ws-butler-mode))

(use-package windmove
  :config
  ;; use shift + arrow keys to switch between visible buffers
  (windmove-default-keybindings))


;; ;; Package: undo-tree
;; Undo && Redo
(use-package undo-tree
  :init
  (global-undo-tree-mode)
  :bind(("C-z"       . undo)
        ("C-S-z"     . redo))
  :custom
  (undo-tree-auto-save-history t)
  (undo-tree-history-directory-alist '(("." . "~/.emacs.d/persistent/undo-tree-history")))
  (undo-tree-visualizer-diff t)
  (undo-tree-visualizer-timestamps t))


(use-package projectile
     :diminish projectile-mode
     :commands (projectile-ack
         projectile-ag
         projectile-compile-project
         projectile-dired
         projectile-find-dir
         projectile-find-file
         projectile-find-tag
         projectile-test-project
         projectile-grep
         projectile-invalidate-cache
         projectile-kill-buffers
         projectile-multi-occur
         projectile-project-p
         projectile-project-root
         projectile-recentf
         projectile-regenerate-tags
         projectile-replace
         projectile-replace-regexp
         projectile-run-async-shell-command-in-root
         projectile-run-shell-command-in-root
         projectile-switch-project
         projectile-switch-to-buffer
         projectile-vc)
     :config
     (progn
    ;; work around for this issue https://github.com/bbatsov/projectile/issues/1322
    (setq projectile-git-command "fd . --print0 --no-ignore-vcs --color never")
    (setq projectile-completion-system 'ivy)
    (setq projectile-indexing-method 'alien)
    (add-to-list 'projectile-other-file-alist '("tex" . ("pdf")))
    (add-to-list 'projectile-other-file-alist '("pdf" . ("tex")))
    (projectile-mode)))


(use-package ggtags
  :ensure t
  :bind
  (("M-*" . pop-tag-mark)))


(use-package neotree
  :config
  :bind (("C-c m" . neotree-toggle)))


(use-package eglot
  :ensure t
  :preface
  (setq-default eglot-workspace-configuration '((:gopls :usePlaceholders t :staticcheck t :completeUnimported t)))
  :config
  (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))

  (defun my-eglot-organize-imports ()
    (interactive)
    (eglot-code-actions nil nil "source.organizeImports" t))

  (defun my-eglot-setup ()
    (interactive)
    (add-hook 'go-mode-hook 'eglot-ensure)
    (add-hook 'before-save-hook 'my-eglot-organize-imports nil t)
    (add-hook 'before-save-hook 'eglot-format-buffer nil t))

  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'eglot-managed-mode-hook 'my-eglot-setup)

  (define-key eglot-mode-map (kbd "C-c r") 'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c C-i") 'eglot-find-implementation))


(use-package company
  :ensure t
  :after eglot
  :hook (eglot-managed-mode . company-mode)  ; starts company when eglot is started
  :bind (("C-n"   . company-select-next)
         ("C-p"   . company-select-previous)
         ("C-d"   . company-show-doc-buffer)
         ("C-<tab>" . company-complete))
  :config (progn
            (setq company-tooltip-limit 10)
            (setq company-idle-delay 0)
            (setq company-echo-delay 0)
            (setq company-minimum-prefix-length 2)
            (setq company-require-match nil)
            (setq company-selection-wrap-around t)
            (setq company-tooltip-align-annotations t)
            ;; weight by frequency)
            (setq company-transformers '(company-sort-by-occurrence))))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
    ;; set the leading bullet to be a space. For alignment purposes I use an em-quad space (U+2001)
    (org-superstar-headline-bullets-list '(" "))
    (org-superstar-todo-bullet-alist '(("DONE" . ?✔)
                                       ("TODO" . ?⌖)
                                       ("ISSUE" . ?)
                                       ("BRANCH" . ?)
                                       ("FORK" . ?)
                                       ("MR" . ?)
                                       ("MERGED" . ?)
                                       ("GITHUB" . ?A)
                                       ("WRITING" . ?✍)
                                       ("WRITE" . ?✍)
                                       ))
    (org-superstar-special-todo-items t)
    (org-superstar-leading-bullet ""))

(use-package golden-ratio :ensure t)
(golden-ratio-mode 1)

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t)

(add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(provide 'core-packages)
