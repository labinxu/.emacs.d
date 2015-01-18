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
(if (string-equal system-type "windows-nt")
    (progn
      (require 'popwin)
      (popwin-mode)))

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
  (add-to-list 'custom-theme-load-path (concat emacs-color-theme-dir dir))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
