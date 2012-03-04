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
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/home/simon/lisp/sbcl-root/bin/sbcl")

;; Indentation.
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defun set-js-indentation ()
  (setq indent-tabs-mode t))

(add-hook 'js-mode-hook 'set-js-indentation)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((Package . CL-FAD) (Package . CL-USER) (Package . CL-PPCRE) (Package . ODD-STREAMS) (Package . DRAKMA) (Base . 10) (Package . HUNCHENTOOT) (Syntax . COMMON-LISP)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
