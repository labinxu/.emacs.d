(require 'tabbar)
(tabbar-mode 1)
(custom-set-variables '(tabbar-separator (quote (0.5))))
(global-set-key [(C tab)] 'tabbar-forward)
(global-set-key [(C S tab)] 'tabbar-backward)


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