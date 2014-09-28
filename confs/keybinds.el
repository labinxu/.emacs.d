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


;;;;;;;;edit;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-c C-w") 'kill-region)
(global-set-key (kbd "C-c M-w") 'xah-copy-line-or-region)
(global-set-key (kbd "C-c M-x") 'xah-cut-line-or-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-c c") 'copy-symbol-at-point)
(global-set-key (kbd "C-c x") 'cut-symbol-at-point)

(define-key search-map "s" 'extend-selection);;M-s s
(define-key search-map "o" 'occur-at-point);;M-s O

(define-key search-map "f" 'goto-char-forward)
(define-key search-map "b" 'goto-char-backward)
(define-key search-map "p" 'projectile-find-file)
(define-key search-map "s" 'projectile-switch-to-buffer)


;;windows and buffer
(global-set-key [(control shift up)] 'enlarge-window)
(global-set-key [(control shift down)] 'shrink-window)
(global-set-key [(control shift left)] 'enlarge-window-horizontally)
(global-set-key [(control shift right)] 'shrink-window-horizontally)
(global-set-key [(meta k)]
 (lambda () 
 (interactive) 
 (kill-buffer) 
 (delete-window)))
;;;;for neotree
(global-set-key [f11] 'neotree-toggle) 
;;;;;;;;;;;;;;;;;;helm;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c j") 'helm-imenu)
