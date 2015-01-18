;; -*- coding: utf-8 -*-
(require 'helm)
(require 'helm-config)
(require 'helm-command)
(require 'helm-elisp)
(require 'helm-misc)
(require 'helm-descbinds)
(require 'helm-grep)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; helm -gtags setup
(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 ;;helm-gtags-prefix-key "C-c g"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z
(define-key helm-grep-mode-map (kbd "<return>") 'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n") 'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p") 'helm-grep-mode-jump-other-window-backward)

(define-key global-map [remap find-tag] 'helm-gtags-dwim)

(define-key global-map [remap list-buffers] 'helm-buffers-list)
(add-hook 'eshell-mode-hook
#'(lambda ()
(define-key eshell-mode-map (kbd "M-l") 'helm-eshell-history)))

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;;(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq helm-idle-delay 0.1
helm-input-idle-delay 0
helm-candidate-number-limit 300
helm-samewindow nil
helm-quick-update t)

(helm-descbinds-mode)
(helm-match-plugin-mode t)
(defvar helm-source-emacs-commands
'((name . "Emacs Commands")
(candidates . (lambda ()
(let (commands)
(mapatoms (lambda (a)
(if (commandp a)
(push (symbol-name a)
commands))))
(sort commands 'string-lessp))))
(type . command)
(requires-pattern . 2)))
(defun my-helm ()
(interactive)
(let ((default (thing-at-point 'symbol)))
(helm
:prompt "pattern: "
:sources
(append '(helm-source-buffers-list
helm-source-recentf
helm-source-files-in-current-dir
helm-source-emacs-commands
helm-source-pp-bookmarks
helm-source-buffer-not-found
)
))))
(global-set-key (kbd "C-;") 'my-helm)
;; http://d.hatena.ne.jp/IMAKADO/20080724/1216882563
(when (require 'helm-c-moccur nil t)
(global-set-key (kbd "C-c C-o") 'helm-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-c C-M-o") 'helm-c-moccur-dmoccur)
(add-hook 'dired-mode-hook
'(lambda ()
(local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))
(global-set-key (kbd "C-M-s") 'helm-c-moccur-isearch-forward)
(global-set-key (kbd "C-M-r") 'helm-c-moccur-isearch-backward)
(setq helm-c-moccur-helm-idle-delay 0.1)
(setq helm-c-moccur-higligt-info-line-flag t)
(setq helm-c-moccur-enable-auto-look-flag t)
)
(when (require 'helm-ls-git nil t)
(global-set-key (kbd "C-c :") 'helm-ls-git-ls)
)
;; helm-project.el
;; http://d.hatena.ne.jp/yuheiomori0718/20111226/1324902529
(when (require 'helm-project nil t)
(global-set-key (kbd "C-:") 'helm-project)
(hp:add-project
:name 'project
:look-for '(".git")
:include-regexp '("\\.scala$" "\\.html$" "\\.conf$" "\\.properties$" "\\.sbt$" "\\.sql$" "\\routes$" "\\.js$")
:exclude-regexp "/target*"
)
;; 候補にディレクトリが含まれないようにする
;; http://d.hatena.ne.jp/IMAKADO/20090823/1250963119
(setq hp:project-files-filters
(list
(lambda (files)
(remove-if 'file-directory-p files))))
)
(when (require 'helm-projectile)
(global-set-key (kbd "C-c f") 'helm-projectile)
)
;; helm-c-yasnippet.el
(when (require 'helm-c-yasnippet nil t)
(setq helm-c-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)
)
(require 'helm-replace-string nil t)
(require 'helm-ag nil t)
(require 'helm-ag-r nil t)
(require 'helm-rails nil t)
(require 'imenu-anywhere nil t)
(global-set-key (kbd "C-x f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-z") 'helm-do-grep)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-c I") 'helm-imenu-anywhere)
(global-set-key (kbd "C-c e") 'helm-elscreen)
(global-set-key (kbd "C-c C-s") 'helm-spaces)
(global-set-key (kbd "C-M-z") 'helm-resume)
(define-key helm-map (kbd "C-p") 'helm-previous-line)
(define-key helm-map (kbd "C-n") 'helm-next-line)
(define-key helm-map (kbd "C-M-n") 'helm-next-source)
(define-key helm-map (kbd "C-M-p") 'helm-previous-source)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-c h o") 'helm-occur)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-swoop)
;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; When doing evil-search, hand the word over to helm-swoop
;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)
;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)
;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)
(setq helm-swoop-speed-or-color t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-ag)
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-command-option "--all-text")
(setq helm-ag-insert-at-point 'symbol)

(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))