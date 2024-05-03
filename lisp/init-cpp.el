(add-to-list 'eglot-server-programs 
	     '((c++-mode c-mode c++-ts-mode c-ts-mode) 
	       "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)

(provide 'init-cpp)
