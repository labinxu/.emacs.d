(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'grizzl)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
