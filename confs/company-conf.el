(require 'company)
(setq company-backends (delete 'company-semantic company-backends))
(require 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-c-headers))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2)
(setq company-auto-complete t)
(setq company-minimum-prefix-length 1)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun complete-or-indent ()
    (interactive)
    (if (company-manual-begin)
        (company-complete-common)
      (indent-according-to-mode)))
      
(defun indent-or-complete ()
    (interactive)
    (if (looking-at "\\_>")
        (company-complete-common)
      (indent-according-to-mode)))
  (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))

  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))

  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas/minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))

(global-set-key [tab] 'tab-indent-or-complete)

(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/include")
(add-to-list 'company-c-headers-path-system "/include/c++/3.4.5")
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.2.1")
(add-to-list 'company-c-headers-path-system ".")
(add-to-list 'company-c-headers-path-system "C:/MinGW/include")
(add-to-list 'company-c-headers-path-system "C:/MinGW/msys/1.0/include")
(add-to-list 'company-c-headers-path-system "C:/MinGW/lib/gcc/mingw32/4.8.1/include/c++")
(add-to-list 'company-c-headers-path-system ".")

(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))
