
(setq alpha-list '((95 95) (100 100)))
;;change the select background color
(set-face-attribute 'region nil :background "#483d8b")
(defun loop-alpha()
(interactive)
(let ((h (car alpha-list)))
((lambda (a ab)
(set-frame-parameter (selected-frame) 'alpha (list a ab))
(add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
(car h) (car (cdr h)))
(setq alpha-list (cdr (append alpha-list (list h))))))

(loop-alpha)
;;启动0.5秒后自动最大化 （windows下)
(if (string-equal system-type "windows-nt")
    (run-with-idle-timer 1 nil 'w32-send-sys-command 61488)
  (toggle-frame-fullscreen)
  )

;; set default font in initial window and for any new window
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-11"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
    )
  )
 ((string-equal system-type "darwin")   ; Mac OS X
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-12"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12")))
  )
 ((string-equal system-type "gnu/linux") ; linux
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-10"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10")))
  )
 )
(font-family-list)
;;fonts
(defun xah-set-font(font)
  (interactive)
  (set-frame-font font t)
  )

;;(xah-set-font "DejaVv Sans Mono")
(defcustom font-list nil "A list of fonts for `cycle-font' to cycle from." :group 'font)
(set-default 'font-list
 (cond
  ((string-equal system-type "windows-nt")
   '("Courier New-12"
     "DejaVu Sans Mono-12"
     "Segoe UI symbol-12"
     "DejaVu Sans-10"
     "Lucida Sans Unicode-10"
     "Arial Unicode MS-10"))
  ((string-equal system-type "gnu/linux")
   '("DejaVu Sans Mono-9"
     "DejaVu Sans-9"
     "Symbola-13"))
))
(defun cycle-font (n)
  (interactive "p")
  (let (fontToUse stateBefore stateAfter)
    (setq stateBefore (if (get 'cycle-font 'state) (get 'cycle-font 'state) 0))
    (setq stateAfter (% (+ stateBefore (length font-list) n) (length font-list)))
    (setq fontToUse (nth stateAfter font-list))
    (set-frame-parameter nil 'font fontToUse)
    (redraw-frame (select-frame))
    (message "Current font is: %s" fontToUse)
    (put 'cycle-font 'state stateAfter)))
(defun cycle-font-forward()
  (interactive)
  (cycle-font 1))
(defun cycle-font-backward()
  (interactive)
  (cycle-font -1))
;;(load-theme 'monokai t)
(require 'color-theme-solarized)
(color-theme-solarized)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-frame-parameter frame
                                 'background-mode
                                 (if (display-graphic-p frame) 'light 'dark))
            (enable-theme 'solarized)))