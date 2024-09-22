;;; init-ide.el --- basic ide config -*- lexical-binding: t -*-
;;; Commentary:

;; basic ide config

;;; code:


;; basic config
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'which-function-mode)

;; indent
(setq indent-tabs-mode nil)
;; indent
(require 'cc-vars)
(setq c-default-style "linux"
      c-basic-offset 4)

(require 'ansi-color)
(defun display-ansi-colors ()
  (interactive)
  (let ((inhibit-read-only t))
  (ansi-color-apply-on-region (point-min) (point-max))))

;; company
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1))


;; enable eglot
(use-package eglot
  :bind (:map eglot-mode-map
	      ("C-c d" . eldoc)
	      ("C-c a" . eglot-code-action)
	      ("C-c r" . eglot-rename)
              ("C-c e f" . eglot-format)))


;; use flycheck instead of flymake in eglot
(defun +lsp-eglot-prefer-flycheck-h ()
  (when eglot--managed-mode
    (flymake-mode -1)
    (flycheck-buffer-deferred)))
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :hook (eglot-managed-mode . +lsp-eglot-prefer-flycheck-h)
  :config
  (setq-default flycheck-emacs-lisp-load-path 'inherit)
 )


;; treesit
(use-package treesit-auto
  :ensure t
  :demand t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
(setq treesit-font-lock-level 4)


;; magit
(use-package magit
  :ensure t
  :bind ("C-c m s" . magit-status)
  :bind ("C-c m c" . magit-git-command))
;; magit-delta
(use-package magit-delta
  :ensure t
  :hook (magit-mode . magit-delta-mode))


;; gdb
(require 'gdb-mi)
(setq gdb-many-windows t)
(setq gdb-show-main t)


;; yasnippet
(use-package
  yasnippet
  :ensure t
  :defer t
  :hook (company-mode . yas-minor-mode)
  :config (yas-reload-all))
(use-package
  yasnippet-snippets
  :ensure t
  :config (yas-reload-all))


;; document viewer of dev
(use-package devdocs
  :ensure t
  :bind ("C-h D" . devdocs-lookup))


;; project
(require 'project)


;; highlight indent guides
(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  (set-face-background 'highlight-indent-guides-even-face "dimgray")
  (set-face-foreground 'highlight-indent-guides-character-face "dimgray"))



(provide 'init-ide)
;;; init-ide.el ends here
