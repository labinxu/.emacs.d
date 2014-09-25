(require 'tabbar)
(tabbar-mode 1)
(custom-set-variables '(tabbar-separator (quote (1))))
(global-set-key [(C tab)] 'tabbar-forward-tab)
(global-set-key [(C S tab)] 'tabbar-backward-tab)


;;(setq tabbar-buffer-groups-function
;;      (lambda()(list "All")))
(set-face-attribute 'tabbar-button nil)

;;set tabbar's backgroud color
(set-face-attribute 'tabbar-default nil
                    :background "gray"
                    :foreground "gray30")
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :background "green"
                    :box '(:line-width 3 :color "DarkGoldenrod") )
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 3 :color "gray"))
(defun my-tabbar-buffer-groups ()  
  "Return the list of group names the current buffer belongs to.  
Return a list of one element based on major mode."  
  (list  
   (cond  
    ((or (get-buffer-process (current-buffer))  
         ;; Check if the major mode derives from `comint-mode' or  
         ;; `compilation-mode'.  
         (tabbar-buffer-mode-derived-p  
          major-mode '(comint-mode compilation-mode)))  
     "Process"  
     )  
    ((string-equal "*" (substring (buffer-name) 0 1))  
     "Emacs Buffer"  
     )  
    ((eq major-mode 'dired-mode)  
     "Dired"  
     )  
    (t  
     "User Buffer"  
     ))))  
  
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)  