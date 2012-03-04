;; UI stuff.
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode +1)
(column-number-mode +1)

;; Better buffer switcher.
(iswitchb-mode +1)

;; Keybindings.
(global-set-key (kbd "C-.") 'iswitchb-buffer)
(global-set-key (kbd "C-,") 'delete-other-windows)
(global-set-key (kbd "C-z") 'slime-selector)
(global-set-key (kbd "M-j") 'join-line)

;; The following assumes (ql:quickload "quicklisp-slime-helper") has been run.
;(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
;(setq inferior-lisp-program "/home/simon/lisp/sbcl-root/bin/sbcl")

;; Indentation.
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defun set-js-indentation ()
  (setq indent-tabs-mode t))

(add-hook 'js-mode-hook 'set-js-indentation)

