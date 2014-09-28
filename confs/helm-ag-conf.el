(require 'helm-ag)

(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-command-option "--all-text")
(setq helm-ag-insert-at-point 'symbol)

(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))