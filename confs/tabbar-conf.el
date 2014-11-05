(require 'tabbar)
;;tabbar
(tabbar-mode 1)
(global-set-key [(C tab)] 'tabbar-forward)
(global-set-key [(backtab)] 'tabbar-backward)
(global-set-key [(control |)] 'tabbar-backward-group)
;;(global-set-key [(control S meta |)] 'tabbar-forward-group)
;;set group strategy
(defun tabbar-buffer-groups ()
"tabbar group"
(list
(cond
((memq major-mode '(shell-mode sh-mode))
"shell"
)
((memq major-mode '(c-mode c++-mode))
"cc"
)
((memq major-mode '(dired-mode ibuffer-mode))
"files"
)
((eq major-mode 'python-mode)
"python"
)
((eq major-mode 'ruby-mode)
"ruby"
)
((memq major-mode
'(php-mode nxml-mode nxhtml-mode))
"WebDev"
)
((eq major-mode 'emacs-lisp-mode)
"Emacs-lisp"
)
((memq major-mode
'(tex-mode latex-mode text-mode snippet-mode org-mode moinmoin-mode markdown-mode))
"Text"
)
((string-equal "*" (substring (buffer-name) 0 1))
"emacs"
)
(t
"other"
)
)))
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
;;;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
(set-face-attribute 'tabbar-default nil
:family "Comic Sans MS" ;"Vera Sans YuanTi Mono"
:background "gray30"
:foreground "#dcdccc"
:height 1.0
)
;; 设置左边按钮外观：外框框边大小和颜色
(set-face-attribute 'tabbar-button nil
:inherit 'tabbar-default
:box '(:line-width 2 :color "gray30")
)
(set-face-attribute 'tabbar-separator nil
:inherit 'tabbar-default
:foreground "blue"
:background "dark gray"
:box '(:line-width 2 :color "dark gray" :style 'released-button)
)
;(setq tabbar-separator-value "§")
(setq tabbar-separator (list 0.5))
;; 设置当前tab外观：颜色，字体，外框大小和颜色
(set-face-attribute 'tabbar-selected nil
:inherit 'tabbar-default
:foreground "orange" ;"DarkGreen"
:background "dark magenta" ;"LightGoldenrod"
:box '(:line-width 2
:color "DarkGoldenrod"
:style 'pressed-button)
:weight 'bold
)
;; 设置非当前tab外观：外框大小和颜色
(set-face-attribute 'tabbar-unselected nil
:inherit 'tabbar-default
:box '(:line-width 2 :color "dark gray" :style 'released-button))
