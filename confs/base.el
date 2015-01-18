(setq user-full-name "Labin.xu")
(setq user-mail-address "flowinair@gmail.com")
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'icomplete-mode) (icomplete-mode t))
(setq frame-title-format
      (list "Emacs " emacs-version "@" '(buffer-file-name "%f" "%b")))

;;close startup message
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default cursor-type 'bar)
(setq enable-recursive-minibuffers t)
(setq suggest-key-bindings 1) 
;;(set-language-environment 'UTF-8)
(setq-default comment-column 80)
(setq mouse-drag-copy-region nil)
(setq x-select-enable-clipboard t)
(set-clipboard-coding-system 'ctext)
(setq make-backup-files -1)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq track-eol t)
(setq visible-bell t);关闭出错时的提示声
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; modes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(auto-save-mode nil)
(transient-mark-mode t)
(global-linum-mode t)
(column-number-mode t)
(global-hl-line-mode t)
(require 'generic-x)
(setq-default indent-tabs-mode nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun xah-cut-line-or-region()
  "Cut the current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (line-beginning-position) (line-beginning-position 2))))

(defun xah-copy-line-or-region()
  "Copy the current line, or current text selection"
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun copy-symbol-at-point ()
  (interactive)
  (if (get 'symbol 'thing-at-point)
      (funcall (get 'symbol 'thing-at-point))
    (let ((bounds (bounds-of-thing-at-point 'symbol)))
      (when bounds
        (let ( (begin (car bounds))
               (end   (cdr bounds)) )
          (kill-ring-save begin end)
          (if (fboundp 'pulse-momentary-highlight-region)
              (pulse-momentary-highlight-region begin end)))
          ))))
(defun cut-symbol-at-point ()
  (interactive)
  (if (get 'symbol 'thing-at-point)
      (funcall (get 'symbol 'thing-at-point))
    (let ((bounds (bounds-of-thing-at-point 'symbol)))
      (when bounds
        (let ( (begin (car bounds))
               (end   (cdr bounds)) )
          (kill-region begin end)
          )
          ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
(defun select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
Delimiters are paired characters:
 () [] {} «» ‹› “” 〖〗 【】 「」 『』 （） 〈〉 《》 〔〕 ⦗⦘ 〘〙 ⦅⦆ 〚〛 ⦃⦄
 For practical purposes, also: \"\", but not single quotes."
 (interactive)
 (let (p1)
   (skip-chars-backward "^<>([{“「『‹«（〈《〔【〖⦗〘⦅〚⦃\"")
   (setq p1 (point))
   (skip-chars-forward "^<>)]}”」』›»）〉》〕】〗⦘〙⦆〛⦄\"")
   (set-mark p1)
 ))
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; by Nikolaj Schumacher, 2008-10-20. Released under GPL.
(defun semnav-up (arg)
  (interactive "p")
  (when (nth 3 (syntax-ppss))
    (if (> arg 0)
        (progn
          (skip-syntax-forward "^\"")
          (goto-char (1+ (point)))
          (decf arg))
      (skip-syntax-backward "^\"")
      (goto-char (1- (point)))
      (incf arg)))
  (up-list arg))
  
 ;; by Nikolaj Schumacher, 2008-10-20. Released under GPL.
(defun extend-selection (arg &optional incremental)
  "Select the current word.
Subsequent calls expands the selection to larger semantic unit."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (or (region-active-p)
                         (eq last-command this-command))))
  (if incremental
      (progn
        (semnav-up (- arg))
        (forward-sexp)
        (mark-sexp -1))
    (if (> arg 1)
        (extend-selection (1- arg) t)
      (if (looking-at "\\=\\(\\s_\\|\\sw\\)*\\_>")
          (goto-char (match-end 0))
        (unless (memq (char-before) '(?\) ?\"))
          (forward-sexp)))
      (mark-sexp -1))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun occur-at-point (nlines)
(interactive "P")
(occur (format "%s" (thing-at-point 'symbol)) nlines))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun goto-char-forward (n char)
  "Move forward to Nth occurence of CHAR.
	Typing `wy-go-to-char-key' again will move forwad to the next Nth occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
             char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
  
(defun goto-char-backward (n char)
  "Move forward to Nth occurence of CHAR.
	Typing `wy-go-to-char-key' again will move forwad to the next Nth occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-backward (string char) nil nil n)
  (while (char-equal (read-char)
             char)
    (search-backward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

 (defun current-file-name-nondirectory()
  (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))
  )
(provide 'base)
