(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(require 'wcy-desktop)
(wcy-desktop-init)