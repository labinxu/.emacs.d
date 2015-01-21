;; -*- coding: utf-8 -*-
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c \\") 'comment-indent) ;
(require 'recent-jump)
(recent-jump-mode t)
(global-set-key (kbd "C-c C-,") 'recent-jump-forward)
(global-set-key (kbd "C-c C-.") 'recent-jump-backward)
;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'window-numbering)
(window-numbering-mode t)

(winner-mode)
(global-set-key(kbd "C-c u w") 'winner-undo)
;;;;;;;;edit;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-c C-w") 'kill-region)
(global-set-key (kbd "C-c M-w") 'xah-copy-line-or-region)
(global-set-key (kbd "C-c M-x") 'xah-cut-line-or-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c c w") 'copy-symbol-at-point)
(global-set-key (kbd "C-c c x") 'cut-symbol-at-point)
(global-set-key (kbd "C-c c o") 'occur-at-point)
(global-set-key (kbd "C-c c m") 'extend-selection)

(global-set-key (kbd "C-c s F") 'projectile-helm-ag)
(global-set-key (kbd "C-c s f") 'helm-ag)

(define-key search-map "f" 'goto-char-forward)
(define-key search-map "b" 'goto-char-backward)
;; show unncessary whitespace that can mess up your diff
(global-set-key (kbd "C-c w") 'whitespace-mode)
(add-hook 'prog-mode-hook
    (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; use space to indent by default
(setq-default indent-tabs-mode nil)

;;windows and buffer
(global-set-key [(meta f12)] 'toggle-frame-fullscreen)
(global-set-key [(control shift up)] 'enlarge-window)
(global-set-key [(control shift down)] 'shrink-window)
(global-set-key [(control shift left)] 'enlarge-window-horizontally)
(global-set-key [(control shift right)] 'shrink-window-horizontally)
(global-set-key [(meta k)]
 (lambda ()
 (interactive)
 (kill-buffer)
 (delete-window)))

(when (eq system-type 'darwin)
    (setq mac-option-modifier 'meta)
    (setq mac-command-modifier 'meta)
    )


(global-set-key [C-f1] 'show-file-name)
(global-set-key [kp-delete] 'delete-char)
;;;;for neotree
(global-set-key [(meta f11)] 'neotree-toggle)
