(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(setq projectile-indexing-method 'native)
(require 'grizzl)
;;(setq projectile-completion-system 'grizzl)
(setq projectile-completion-system 'default)