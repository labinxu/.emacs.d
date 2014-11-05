;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 22:38:44 Saturday by ahei>

(require 'highlight-parentheses)
(highlight-parentheses-mode t)
(require 'highlight-indentation)
(highlight-indentation-mode t)

(require 'highlight-symbol)
(global-set-key [(control f4)] 'highlight-symbol-at-point)
(global-set-key [f4] 'highlight-symbol-next)
(global-set-key [(shift f4)] 'highlight-symbol-prev)
(global-set-key [(meta f4)] 'highlight-symbol-query-replace)
