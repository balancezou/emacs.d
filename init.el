;;-------------------------------
;; bootstrap config
;;-------------------------------
;; load site-lisp default path
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Measure startup time
(require 'init-benchmarking)
;; init fold/toggle
(require 'init-hs)
;; init common config
(require 'init-local)
;; init package
(require 'init-package)
;; init code base config as ide
(require 'init-ide)
;; init cpp
;(require 'init-cpp)
;; init java
;(require 'init-java)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
