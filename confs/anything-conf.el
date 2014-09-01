;; -*- coding: utf-8 -*-
;;(require 'anything-config)
;;(provide 'anything-conf)
(require 'helm-config)
(helm-mode 1)
(require 'projectile)
(add-hook 'python-mode-hook 'projectile-mode)