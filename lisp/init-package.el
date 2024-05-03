;; package install config
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                          ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; display keys on mode line
(use-package keycast
  :ensure t
  :config
  (keycast-mode-line-mode t)
  ;(keycast-header-line-mode t) 
  ;(keycast-tab-bar-mode t)
  ;(keycast-log-mode t)	      
  )


;; smex
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; eim
(use-package pyim
  :ensure t)

;; dired-subtree
(use-package dired-subtree
  :ensure t
  :init
  (setq dired-subtree-use-backgrounds nil)
  :bind ("C-c d" . dired-jump)
  :config
  (bind-keys :map dired-mode-map
             ("i" . dired-subtree-insert)
             (";" . dired-subtree-remove)
             ("l" . dired-find-file)
             ("h" . dired-up-directory)
             ("j" . dired-next-line)
             ("k" . dired-previous-line)))

(provide 'init-package)
