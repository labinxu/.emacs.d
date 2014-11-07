(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'grizzl)
;;(setq projectile-completion-system 'grizzl)
(setq projectile-completion-system 'default)