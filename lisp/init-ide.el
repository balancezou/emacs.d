;; enable eglot
(require 'eglot)

;; treesit
(use-package treesit-auto
  :ensure t
  :demand t
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))
(setq treesit-font-lock-level 4)

;; install & enable magit
(use-package magit
  :ensure t
  :bind (("C-c m s" . magit-status)))


(provide 'init-ide)
