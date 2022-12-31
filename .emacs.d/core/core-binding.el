;;; core-binding.el
;; Author: Benjamin Lancinot

(defhydra hydra-diff ()
  "
Buffers^^             ^Files^         ^VC^           ^Regions^
---------------------------------------------------------------
_b_uffers           _f_iles           _r_evisions    _l_inewise
_B_uffers (3-way)   _F_iles (3-way)   ^ ^            _w_ordwise
^ ^                 _c_urrent file

"
  ("b" ediff-buffers)
  ("B" ediff-buffers3)
  ("f" ediff-files)
  ("F" ediff-files3)
  ("c" ediff-current-file)
  ("r" ediff-revision)
  ("l" ediff-regions-linewise)
  ("w" ediff-regions-wordwise)
  ("ENTER" nil))

(defhydra hydra-hs ()
   "
Hide^^            ^Show^            ^Toggle^    ^Navigation^
----------------------------------------------------------------
_↑_ hide all      _↓_ show all      _t_oggle    _n_ext line
_←_ hide block    _→_ show block    ^ ^         _p_revious line
_l_ hide level

"
   ("<down>" hs-show-all)
   ("<up>" hs-hide-all)
   ("<right>" hs-show-block)
   ("<left>" hs-hide-block)
   ("t" hs-toggle-hiding)
   ("l" hs-hide-level)
   ("n" forward-line)
   ("p" (forward-line -1))
   ("ENTER" nil))


(defhydra hydra-zoom ()
  "
Zoom^^
---------------------------------------------------
_+_ inc        _+_ dec         _0_ reset
"
  ("+" text-scale-increase "in")
  ("-" text-scale-decrease "out")
  ("0" (text-scale-adjust 0) "reset")
  ("ENTER" nil))



(defhydra hydra-compile ()
    "
Compilation^^
---------------------------------------------------
_c_ompile       _n_ext error        _f_irst error
^ ^             _p_revious error    _l_ast error

"
    ("c" compile)
    ("n" next-error)
    ("p" previous-error)
    ("f" first-error)
    ("l" (condition-case err
             (while t
               (next-error))
           (user-error nil)))
    ("ENTER" nil))



(defhydra hydra-windows ()
   "
^Movement^      ^Split^           ^Switch^      ^Delete^
---------------------------------------------------------
_←_           _v_ertical         _a_ce          _D_elete Other
_↓_            _h_orizontal      _s_wap         _d_elete
_↑_            ^ ^^              ^ ^            _o_nly this
_→_

"
   ("<left>" windmove-left )
   ("<down>" windmove-down )
   ("<up>" windmove-up )
   ("<right>" windmove-right )
   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right)))
   ("h" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down)))
   ("a" (lambda ()
          (interactive)
          (ace-window 1)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)))
   ("s" (lambda ()
          (interactive)
          (ace-window 4)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)))
   ("d" delete-window)
   ("D" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
       )
   ("o" delete-other-windows)
   ("ENTER" nil))

(defhydra hydra-project ()
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache                      Bookmark
------------------------------------------------------------------------------------------------------------------
  _f_: file            _a_: ag                _i_: Ibuffer       _c_: cache clear           _s_: set new
  _D_: file dwim       _g_: update gtags      _b_: switch        _x_: remove known project  _j_: jump
  _F_: file curr dir   _o_: multi-occur       _K_: Kill buffers  _X_: cleanup non-existing
  _r_: recent file     _g_: grep              ^ ^                _z_: cache current
  _d_: dir             _G_: git grep
  _p_: project

"
  ("f"   projectile-find-file)
  ("D"   projectile-find-file-dwim)
  ("F"   projectile-find-file-in-directory)
  ("r"   projectile-recentf)
  ("d"   projectile-find-dir)
  ("p"   projectile-switch-project)
  ("G"   counsel-git-grep)
  ("g"   counsel-projectile-grep)
  ("a"   counsel-projectile-ag)
  ("g"   ggtags-update-tags)
  ("o"   projectile-multi-occur)
  ("b"   projectile-switch-to-buffer)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("c"   projectile-invalidate-cache)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("s"   bookmark-set)
  ("j"   bookmark-jump)
  ("ENTER" nil))


(global-set-key (kbd "M-h") 'hydra-hs/body)
(global-set-key (kbd "M-d") 'hydra-diff/body)
(global-set-key (kbd "M-c") 'hydra-compile/body)
(global-set-key (kbd "M-SPC") 'hydra-windows/body)
(global-set-key (kbd "M-p") 'hydra-project/body)
(global-set-key (kbd "M-z") 'hydra-zoom/body)

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
