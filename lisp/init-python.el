;;; init-python.el --- load python mode  -*- lexical-binding: t -*-
;;; Commentary:

;; load python mode for node

;;; code:


;; disable python native compile,
;; to avoid 'readline' compile failed.
;; Your ‘python-shell-interpreter’ doesn’t seem to support readline,
;; yet ‘python-shell-completion-native’ was t
;; and "python3" is not part of the ‘python-shell-completion-native-disabled-interpreters’ list.
;; Native completions have been disabled locally.
(setq python-shell-completion-native-enable nil)


;; enable treesitter
(use-package python-ts-mode
  :hook ((python-ts-mode . eglot-ensure)
	 (python-ts-mode . company-mode))
  :mode ("\\.py\\'" . python-ts-mode)
  )

;; emacs lisp python environment
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-ts-mode :before 'elpy-enable)
  :config
  (setq elpy-rpc-virtualenv-path 'current)
  (setq pyvenv-workon "venv_test")
  :hook (elpy-mode . flycheck-mode))


;; Enable autopep8 on save
(use-package py-autopep8
  :ensure t
  :config (setq py-autopep8-options '("--max-line-length=80" "--aggressive"))
  :hook ((python-ts-mode) . py-autopep8-mode))


;; enable indent guidance lines
(use-package highlight-indent-guides
  :hook (python-ts-mode . highlight-indent-guides-mode))


(provide 'init-python)
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-python.el ends here
