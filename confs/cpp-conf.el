(require 'base)
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'font-lock)
(require 'eassist)
(defun my-c-mode-common-hook ()
  (define-key c-mode-base-map (kbd "M-o") 'eassist-switch-h-cpp)
  (define-key c-mode-base-map (kbd "M-m") 'eassist-list-methods))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(require 'ede)
(global-ede-mode t)

(setq auto-mode-alist  
    (cons '("\\.h$" . c++-mode)  
     auto-mode-alist)
)  
            
(defun font-lock()
    (global-font-lock-mode t)
)
(global-set-key (kbd "<f5>") 'compile_and_run)
(global-set-key (kbd "<f7>") 'smart-compile) 
;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)
(defun compile_and_run()
  (interactive)
  (progn
    (save-buffer)
    (smart-compile)
    (read-shell-command (concat "./" (current-file-name-nondirectory)))
  )
)
(defun smart-compile-for-single-file() 
  (interactive) 
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile")) 
        (command nil)) 
    (if (not (null 
              (find t candidate-make-file-name :key 
                    '(lambda (f) (file-readable-p f))))) 
        (setq command "make -k ") 
        ;; makefile not found, check the current mode
      (if (null (buffer-file-name (current-buffer))) 
          (message "Buffer not attached to a file, won't compile!") 
        (if (eq major-mode 'c-mode) 
            (setq command 
                   ;;make sure where the compiler 
                  (concat "gcc -Wall -o "
                          (file-name-sans-extension
                           (file-name-nondirectory buffer-file-name))
                          " " 
                          (file-name-nondirectory buffer-file-name) 
                          " -g -lm ")) 
          (if (eq major-mode 'c++-mode) 
              (setq command 
                    (concat "g++ -std=c++11 -Wall -o "
                            (file-name-sans-extension 
                             (file-name-nondirectory buffer-file-name)) 
                            " " 
                            (file-name-nondirectory buffer-file-name) 
                            " -g -lm ")) 
            (message "Unknow mode, won't compile!"))))) 
    (if (not (null command))
        (let ((command (read-from-minibuffer "Compile command: " command))) 
          (compile command)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )
 
(defvar wcy-c/c++-hightligh-included-files-key-map nil)
(if wcy-c/c++-hightligh-included-files-key-map
    nil
  (setq wcy-c/c++-hightligh-included-files-key-map (make-sparse-keymap))
  (define-key wcy-c/c++-hightligh-included-files-key-map (kbd "<RET>") 'find-file-at-point))
 
(defun wcy-c/c++-hightligh-included-files ()
  (interactive)
  (when (or (eq major-mode 'c-mode)
            (eq major-mode 'c++-mode))
    (save-excursion
      (goto-char (point-min))
      ;; remove all overlay first
      (mapc (lambda (ov) (if (overlay-get ov 'wcy-c/c++-hightligh-included-files)
                             (delete-overlay ov)))
            (overlays-in (point-min) (point-max)))
      (while (re-search-forward "^#include[ \t]+[\"<]\\(.*\\)[\">]" nil t nil)
        (let* ((begin  (match-beginning 1))
               (end (match-end 1))
               (ov (make-overlay begin end)))
          (overlay-put ov 'wcy-c/c++-hightligh-included-files t)
          (overlay-put ov 'keymap wcy-c/c++-hightligh-included-files-key-map)
          (overlay-put ov 'face 'underline))))))
;; 这不是一个好办法，也可以把它加载到 c-mode-hook or c++-mode-hook 中。
