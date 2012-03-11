;; UI stuff.
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode +1)
(column-number-mode +1)

;; Better buffer switcher.
(iswitchb-mode +1)

;; Functions meant for keybindings.
(defun duplicate-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank))

;; Keybindings.
(global-set-key (kbd "C-,") 'iswitchb-buffer)
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C--") 'delete-other-windows)
(global-set-key (kbd "C-z") 'slime-selector)
;; Let's put those Swedish keys into use.
(keyboard-translate ?\ö ?\()
(keyboard-translate ?\ä ?\))
(global-set-key (kbd "M-ö") 'paredit-wrap-round)
(global-set-key (kbd "M-ä") 'paredit-close-round-and-newline)

;; The following assumes (ql:quickload "quicklisp-slime-helper") has been run.
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/home/simon/lisp/sbcl-root/bin/sbcl")

;; Paredit.
(add-to-list 'load-path "~/elisp")
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(add-hook 'lisp-mode-hook 'enable-paredit-mode)

;; Indentation.
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(global-set-key (kbd "C-<tab>") 'dabbrev-completion)

(defun setup-slime-indentation ()
  (local-set-key (kbd "<tab>") 'slime-indent-and-complete-symbol)
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'slime-mode-hook 'setup-slime-indentation)

(defun setup-js-indentation ()
  (setq indent-tabs-mode t))

(add-hook 'js-mode-hook 'setup-js-indentation)
