;; -*- coding: utf-8 -*-
(require 'helm-config)
;;(helm-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;browse the kill history
(defadvice yank-pop (around anything-kill-ring-maybe activate)
(if (not (eq last-command 'yank))
       (helm-show-kill-ring)
   ad-do-it))