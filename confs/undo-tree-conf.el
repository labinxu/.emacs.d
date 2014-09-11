(require 'undo-tree)
;;
;; to your .emacs file. Byte-compiling undo-tree.el is recommended (e.g. using
;; "M-x byte-compile-file" from within emacs).
;;


(global-undo-tree-mode)

;; `undo-tree-mode' and `global-undo-tree-mode'
;;   Enable undo-tree mode (either in the current buffer or globally).
;;
;; C-_  C-/  (`undo-tree-undo')
;;   Undo changes.
;;
;; M-_  C-?  (`undo-tree-redo')
;;   Redo changes.
;;
;; `undo-tree-switch-branch'
;;   Switch undo-tree branch.
;;   (What does this mean? Better press the button and see!)
;;
;; C-x u  (`undo-tree-visualize')
;;   Visualize the undo tree.
;;   (Better try pressing this button too!)
;;
;; C-x r u  (`undo-tree-save-state-to-register')
;;   Save current buffer state to register.
;;
;; C-x r U  (`undo-tree-restore-state-from-register')
;;   Restore buffer state from register.
;;
;;
;;
;; In the undo-tree visualizer:
;;
;; <up>  p  C-p  (`undo-tree-visualize-undo')
;;   Undo changes.
;;
;; <down>  n  C-n  (`undo-tree-visualize-redo')
;;   Redo changes.
;;
;; <left>  b  C-b  (`undo-tree-visualize-switch-branch-left')
;;   Switch to previous undo-tree branch.
;;
;; <right>  f  C-f  (`undo-tree-visualize-switch-branch-right')
;;   Switch to next undo-tree branch.
;;
;; C-<up>  M-{  (`undo-tree-visualize-undo-to-x')
;;   Undo changes up to last branch point.
;;
;; C-<down>  M-}  (`undo-tree-visualize-redo-to-x')
;;   Redo changes down to next branch point.
;;
;; <down>  n  C-n  (`undo-tree-visualize-redo')
;;   Redo changes.
;;
;; <mouse-1>  (`undo-tree-visualizer-mouse-set')
;;   Set state to node at mouse click.
;;
;; t  (`undo-tree-visualizer-toggle-timestamps')
;;   Toggle display of time-stamps.
;;
;; d  (`undo-tree-visualizer-toggle-diff')
;;   Toggle diff display.
;;
;; s  (`undo-tree-visualizer-selection-mode')
;;   Toggle keyboard selection mode.
;;
;; q  (`undo-tree-visualizer-quit')
;;   Quit undo-tree-visualizer.
;;
;; C-q  (`undo-tree-visualizer-abort')
;;   Abort undo-tree-visualizer.
;;
;; ,  <
;;   Scroll left.
;;
;; .  >
;;   Scroll right.
;;
;; <pgup>  M-v
;;   Scroll up.
;;
;; <pgdown>  C-v
;;   Scroll down.

