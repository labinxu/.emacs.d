
;; C-c C-a to amend without any prompt

(defun magit-just-amend ()
  (interactive)
  (save-window-excursion
    (magit-with-refresh
      (shell-command "git --no-pager commit --amend --reuse-message=HEAD"))))


(eval-after-load "magit"
  '(define-key magit-status-mode-map (kbd "C-c C-a") 'magit-just-amend))
(defun lscomd()
(interactive)
(shell-command "dir"))


(eval-after-load "company"
(print "helo company"))
(loop for mode in minor-mode-list do (add-to-list 'desktop-minor-mode-table (list mode nil)))
(loop for file in (font-family-list) do (print file))