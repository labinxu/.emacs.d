;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 22:38:44 Saturday by ahei>

(require 'highlight-parentheses)
(highlight-parentheses-mode t)
;; TODO: 最后一项不知道为啥不起作用
(setq hl-paren-colors '("red" "cyan" "violet" "yellow" "magenta"))

(require 'highlight-indentation)
(highlight-indentation-mode t)