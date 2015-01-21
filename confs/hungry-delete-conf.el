
(require 'hungry-delete)

;; add-hook to use in specific modes
;; (add-hook 'tuareg-mode-hook #'(lambda () (hungry-keyboard tuareg-mode-map)))
;; (add-hook 'ruby-mode-hook #'(lambda () (hungry-keyboard ruby-mode-map)))
(add-hook 'c++-mode-hook (lambda() (hungry-keyboard c++-mode-map)))
(add-hook 'python-mode-hook (lambda() (hungry-keyboard python-mode-map)))
;; or use in default key-map
;;(hungry-keyboard global-map)
