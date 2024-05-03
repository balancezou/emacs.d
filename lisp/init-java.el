(use-package eglot-java)
(add-hook 'java-mode-hook 'eglot-java-mode)
(add-hook 'java-ts-mode-hook 'eglot-java-mode)

;; (add-to-list 'eglot-server-programs 
;; 	     '((java-mode java-ts-mode) 
;; 	       "jdtls"))
(add-hook 'java-mode-hook #'eglot-ensure)
(add-hook 'java-ts-mode-hook #'eglot-ensure)

(provide 'init-java)
