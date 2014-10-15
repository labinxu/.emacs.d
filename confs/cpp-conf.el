(require 'base)
(require 'google-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)
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
(defun smart-compile() 
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
