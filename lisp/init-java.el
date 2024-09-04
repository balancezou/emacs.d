;;; init-java.el --- load java mode  -*- lexical-binding: t -*-
;;; Commentary:

;; load java mode for node

;;; code:


(require 'eglot)
(add-to-list 'eglot-server-programs
               `(java-ts-mode (expand-file-name "share/eclipse.jdt.ls/bin/jdtls" user-emacs-directory)
                           "-configuration" ,(expand-file-name "share/eclipse.jdt.ls/config_mac" user-emacs-directory)
                           ))
;; (add-to-list 'eglot-server-programs
;; 	     '((java-ts-mode)
;; 	       (expand-file-name "share/eclipse.jdt.ls/bin/jdtls" user-emacs-directory)))
(add-hook 'java-ts-mode-hook #'eglot-ensure)

(use-package java-ts-mode
  :hook ((java-ts-mode . eglot-ensure)
	     (java-ts-mode . company-mode))
  :mode ("\\.java\\'" . java-ts-mode)
  :config
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
)


;; (use-package eglot-java
;;   :ensure t)
;; (add-hook 'java-mode-hook 'eglot-java-mode)
;; (add-hook 'java-ts-mode-hook 'eglot-java-mode)


(provide 'init-java)
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-java.el ends here
