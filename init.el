(require 'cl)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst emacs-base-dir "~/.emacs.d/"
  "The root directory that all the extra plugin will put in")
(defconst emacs-modules-dir (concat emacs-base-dir "modules/")
    "the modules directory include themes yasnippets ac etc..")
(defconst emacs-confs-dir (concat emacs-base-dir "confs/"))
(defconst emacs-color-theme-dir (concat emacs-base-dir "color-theme/"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;add all module dir in to load path
(dolist
    (dir (directory-files emacs-modules-dir))
  (add-to-list 'load-path (concat emacs-modules-dir dir)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
(dolist
    (dir (directory-files emacs-color-theme-dir))
  (add-to-list 'custom-theme-load-path (concat emacs-color-theme-dir dir)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

(loop for file in (directory-files emacs-confs-dir t "\\.el")
      do (load file nil nil t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   (quote
    (company-gtags company-c-headers company-irony company-clang company-xcode company-cmake company-capf
                   (company-dabbrev-code company-gtags company-etags company-keywords)
                   company-oddmuse company-files company-dabbrev)))
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 140 :width normal)))))
