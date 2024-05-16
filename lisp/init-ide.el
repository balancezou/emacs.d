;;; init-ide.el --- basic ide config -*- lexical-binding: t -*-
;;; Commentary:

;; basic ide config

;;; code:


;; basic config
(add-hook 'prog-mode-hook 'column-number-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'flymake-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'which-function-mode)
(add-hook 'prog-mode-hook
      (lambda ()
        (local-set-key (kbd "M-p") 'flymake-goto-prev-error)
	(local-set-key (kbd "M-n") 'flymake-goto-next-error)))

;; company
;(use-package company
;  :ensure t
;  :hook (prog-mode . company-mode))


;; indent
(setq default-tab-width 4)
(setq indent-tabs-mode nil)


;; enable eglot
(require 'eglot)
;(use-package eglot
;  :bind ("C-c e f" . eglot-format))


;; treesit
(use-package treesit-auto
  :ensure t
  :demand t
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))
(setq treesit-font-lock-level 4)


;; magit
(use-package magit
  :ensure t
  :bind ("C-c m s" . magit-status)
  :bind ("C-c m c" . magit-git-command))


;; gdb
(setq gdb-many-windows t)
(setq gdb-show-main t)


;; project
(use-package project
  :bind-keymap ("C-c p" . project-prefix-map))

(provide 'init-ide)
;;; init-ide.el ends here
