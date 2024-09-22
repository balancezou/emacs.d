;;; init-java.el --- load java mode  -*- lexical-binding: t -*-
;;; Commentary:

;; load java mode for node

;;; code:


;(require 'eglot)
;(add-to-list 'eglot-server-programs
;               `(java-ts-mode (expand-file-name "share/eclipse.jdt.ls/bin/jdtls" user-emacs-directory)
;                           "-configuration" ,(expand-file-name "share/eclipse.jdt.ls/config_linux" user-emacs-directory)
;                           ))

;; (add-to-list 'eglot-server-programs
;;  	         '((java-ts-mode)
;;  	           (expand-file-name "share/eclipse.jdt.ls/bin/jdtls" user-emacs-directory)))
;; (add-hook 'java-ts-mode-hook #'eglot-ensure)

(use-package eglot-java
  :ensure t
  :config
  (setq tab-width 4)
  (setq indent-tabs-mode nil))
(add-hook 'java-mode-hook 'eglot-java-mode)
(add-hook 'java-ts-mode-hook 'eglot-java-mode)

(setq eglot-java-user-init-opts-fn 'custom-eglot-java-init-opts)
(defun custom-eglot-java-init-opts (server eglot-java-eclipse-jdt)
  "Custom options that will be merged with any default settings."
  '(:settings
    (:java
     (:format
      (:settings
       (:url "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml")
       :enabled t)))))

(use-package java-ts-mode
  :hook ((java-ts-mode . eglot-ensure)
	     (java-ts-mode . company-mode))
  :mode ("\\.java\\'" . java-ts-mode)
)


(provide 'init-java)
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-java.el ends here
