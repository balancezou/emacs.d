;;- ------------------------------
;; bootstrap config
;;- ------------------------------
;; load site-lisp default path
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'init-benchmarking) ;; Measure startup time
(require 'init-local)

;; Color Theme
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-blue2)

;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; gtags
;;start Emacs and execute gtags-mode function.
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (require 'gtags)
	    (gtags-mode t)
	    (when (not (string-match "/usr/src/linux/" (expand-file-name default-directory)))  
	      (djcb-gtags-create-or-update))))

;; eim
(add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(autoload 'eim-use-package "eim" "Another emacs input method")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "eim拼音" "eim拼音" "py.txt")
;; ";" to exchange englise input
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)

;; stardict
(require 'stardict)
(global-set-key (kbd "<M-f3>") 'view-stardict-in-buffer)

;; window-number
(require 'window-number)  
(window-number-mode 1)  
(window-number-meta-mode 1)  

;; magit
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/dash")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/with-editor")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
;; (require 'magit)
;; ;; magit document
;; (with-eval-after-load 'info
;;   (info-initialize)
;;   (add-to-list 'Info-directory-list
;; 	       "~/.emacs.d/site-lisp/magit/Documentation/"))
;; (put 'upcase-region 'disabled nil)

;; neotree
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/neotree")
;; (require 'neotree)
;; (global-set-key [f8] 'neotree-toggle)


(provide 'init)
