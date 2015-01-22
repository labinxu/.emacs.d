(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;;(if (string-equals (system-type "windows-nt")
;;
;;))
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)
  (when (string-equal system-type "windows-nt")
    (setq w32-pipe-read-delay 0))
  )
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(require 'irony-cdb)
(require 'irony-completion)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(autoload 'irony-enable "irony")
