;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 22:38:44 Saturday by ahei>

(require 'highlight-parentheses)
(add-hook 'c++-mode-hook 'highlight-parentheses-mode)
(add-hook 'c-mode-hook 'highlight-parentheses-mode)
(add-hook 'python-mode-hook 'highlight-parentheses-mode)
(add-hook 'lisp-mode-hook 'highlight-parentheses-mode)

(require 'highlight-indentation)
(add-hook 'c++-mode-hook 'highlight-indentation-mode)
(add-hook 'c-mode-hook 'highlight-parentheses-mode)
(add-hook 'python-mode-hook 'highlight-parentheses-mode)


(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1"))
(global-set-key [(control f4)] 'highlight-symbol-at-point)
(global-set-key [f4] 'highlight-symbol-next)
(global-set-key [(shift f4)] 'highlight-symbol-prev)
(global-set-key [(meta f4)] 'highlight-symbol-query-replace)
