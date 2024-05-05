;;; init-cpp.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; code:


;; eglot config
(add-to-list 'eglot-server-programs 
	     '((c++-mode c-mode c++-ts-mode c-ts-mode) 
	       "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)


;; switch between source & header
;; https://stackoverflow.com/questions/3509919/emacs-c-opening-corresponding-header-file
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-x C-o") 'ff-find-other-file)))

(provide 'init-cpp)
