;; -*- coding: utf-8 -*-

(provide 'jump-conf)
;;;;
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
;(autoload
;  'ace-jump-mode-pop-mark
;  "ace-jump-mode"
;  "Ace jump back:-)"
;  t)
;(eval-after-load "ace-jump-mode"
;                 -  '(ace-jump-mode-enable-mark-sync))')
;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;If you use viper mode :
;(define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;;(eval-after-load "evil" '(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode))