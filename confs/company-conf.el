(require 'company)
(setq company-backends (delete 'company-semantic company-backends))

(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-begin-commands '(self-insert-command))
(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook
               'org-mode
               'python-mode
               ))
  (add-hook hook 'company-mode))

;;; To retrieve completion candidates for your proreate a file named .dir-locals.el at your project root:
;;;((nil . ((company-clang-arguments . ("-I/home/<user>/project_root/include1/"
;;;;                                     "-I/home/<user>/project_root/include2/")))))

(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
