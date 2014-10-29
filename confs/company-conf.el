(require 'company)
(setq company-backends (delete 'company-semantic company-backends))
(require 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

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
(add-to-list 'company-c-headers-path-system "C:/MinGW/include")
(add-to-list 'company-c-headers-path-system "C:/MinGW/msys/1.0/include")
(add-to-list 'company-c-headers-path-system "C:/MinGW/lib/gcc/mingw32/4.8.1/include/c++")
(add-to-list 'company-c-headers-path-system ".")