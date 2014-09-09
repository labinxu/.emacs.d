
(require 'hungry-delete)

;; add-hook to use in specific modes
;; (add-hook 'tuareg-mode-hook #'(lambda () (hungry-keyboard tuareg-mode-map)))
;; (add-hook 'ruby-mode-hook #'(lambda () (hungry-keyboard ruby-mode-map)))

;; or use in default key-map
(hungry-keyboard global-map)