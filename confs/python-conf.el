;; -*- coding: utf-8 -*-
(setq default-tab-width 4)
(require 'elpy)
(elpy-enable)
(define-key
  python-mode-map
  (kbd "C-c C-x l")
  (lambda() (interactive) (insert "lambda ")))
(define-key
  python-mode-map
  (kbd "C-c C-x m")
  (lambda()
    (interactive)
    (insert "map()")
    (backward-char) 1))

(provide 'python-conf)
