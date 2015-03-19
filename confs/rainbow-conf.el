(require 'rainbow-mode)
(rainbow-mode t)

(require 'rainbow-delimiters)
(add-hook 'c++-mode-hook 'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)