;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)
;;(require 'wcy-desktop)
;;(wcy-desktop-init)

(load "desktop")
(desktop-load-default)
(desktop-read)
(add-hook 'kill-emacs-hook
          '(lambda() (desktop-save "~/")))
