(require 'cl)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst emacs-base-dir "~/.emacs.d/"
  "The root directory that all the extra plugin will put in")
(defconst emacs-modules-dir (concat emacs-base-dir "modules/")
    "the modules directory include themes yasnippets ac etc..")
(defconst emacs-confs-dir (concat emacs-base-dir "confs/"))
(defconst emacs-color-theme-dir (concat emacs-base-dir "color-theme/"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;add all module dir in to load path
(dolist
    (dir (directory-files emacs-modules-dir))
  (add-to-list 'load-path (concat emacs-modules-dir dir)))

(dolist
    (dir (directory-files emacs-modules-dir))
  (add-to-list 'custom-theme-load-path (concat emacs-color-theme-dir dir)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(loop for file in (directory-files emacs-confs-dir t "\\.el")
      do (load file nil nil t))

(if (string-equal system-type "darwin")
    (progn
      (add-to-list 'exec-path "/Library/Frameworks/Python.framework/Versions/2.7/bin")
      (add-to-list 'exec-path "/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages")
      (add-to-list 'exec-path "/opt/local/bin")
      (add-to-list 'exec-path "/opt/local/sbin")
      (add-to-list 'exec-path "/usr/local/bin")
      ))
(setenv "PATH"
    (concat (getenv "PATH") ":" "/usr/local/bin" ":" "/opt/local/sbin" ":" "/opt/local/bin"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   (quote
    ((company-keywords company-clang company-gtags company-c-headers)
     company-gtags company-irony company-xcode company-cmake company-capf
     (company-dabbrev-code company-gtags company-etags company-keywords)
     company-oddmuse company-files company-dabbrev)))
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I./Classes" "-I./cocos2d" "-I./cocos2d/cocos" "-I./cocos2d/cocos/base" "-I./cocos2d/extensions")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
