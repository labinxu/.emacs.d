(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(require 'company)
(global-company-mode t)


(global-set-key (kbd "<f7>") 'smart-compile) 
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
