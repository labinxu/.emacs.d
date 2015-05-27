(require 'android-mode)
(global-set-key [M-f7] (quote android-ant-debug))
(global-set-key [M-f5] (quote android-ant-installd)) ;

(defun runapk()
  (interactive)
  (progn
    (android-ant-debug)
    (android-ant-uninstall)
    (android-ant-installd)
    (android-start-app)))
