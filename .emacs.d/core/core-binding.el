;;; core-binding.el
;; Author: Benjamin Lancinot

;; Move regions
(global-set-key (kbd "M-<up>") 'move-region-up)
(global-set-key (kbd "M-<down>") 'move-region-down)

;; kill all buffers
(global-set-key (kbd "C-x K") 'kill-other-buffers)

;;selectionne le buffer en entier
(global-set-key (kbd "C-S-a") 'mark-whole-buffer)

;; Coller
(global-set-key (kbd "C-v") 'yank)

(provide 'core-binding)
