;;; init-package.el --- install external packages with elpa -*- lexical-binding: t -*-
;;; Commentary:

;; install external packages with elpa

;;; code:


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

;; theme
;(use-package monokai-theme
;  :ensure t
;  :init
;  (load-theme 'monokai 1))


;; display keys on mode line
;(use-package keycast
;  :ensure t
;  :config
;  (keycast-mode-line-mode t)
;  (keycast-header-line-mode t)
;  (keycast-tab-bar-mode t)
;  (keycast-log-mode t)
;  )


;; smex
(use-package smex
  :ensure t
  :init
  (smex-initialize)
  :bind ("M-x" . smex))


;; pyin input
(use-package pyim
  :ensure t)


;; window number
(use-package window-numbering
  :ensure t
  :init
  :hook (after-init . window-numbering-mode))


;; expand-region
(use-package expand-region
  :ensure t)
(global-set-key (kbd "C-=") 'er/expand-region)


;; symon
(use-package symon
  :ensure t)

(provide 'init-package)
;;; init-package.el ends here
