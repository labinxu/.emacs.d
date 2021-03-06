;;----------------------------------------------------------------------------
;; recentf
;;----------------------------------------------------------------------------
;; 最近使ったファイル M-x recentf-open-files　を有効化
;; .recentfを自動保存する
;; http://d.hatena.ne.jp/tomoya/20110217/1297928222
(when (require 'recentf nil t)
(setq recentf-exclude '("~/.emacs.d/resource/.recentf"))
(setq recentf-save-file (expand-file-name "~/.emacs.d/resource/.recentf" user-emacs-directory))
(setq recentf-max-saved-items 2000)
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer
(run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)
)
;; recentf-ext.el
;; http://d.hatena.ne.jp/rubikitch/20091224/recentf
(require 'recentf-ext nil t)
;; こんな設定もできる。
;; http://masutaka.net/chalow/2011-10-30-2.html
(require 'cl)
(defvar my-recentf-list-prev nil)
(defadvice recentf-save-list
(around no-message activate)
"If `recentf-list' and previous recentf-list are equal,
do nothing. And suppress the output from `message' and
`write-file' to minibuffer."
(unless (equal recentf-list my-recentf-list-prev)
(cl-flet ((message (format-string &rest args)
(eval `(format ,format-string ,@args)))
(write-file (file &optional confirm)
(let ((str (buffer-string)))
(with-temp-file file
(insert str)))))
ad-do-it
(setq my-recentf-list-prev recentf-list))))
(defadvice recentf-cleanup
(around no-message activate)
"suppress the output from `message' to minibuffer"
(cl-flet ((message (format-string &rest args)
(eval `(format ,format-string ,@args))))
ad-do-it))
