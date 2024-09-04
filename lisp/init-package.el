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
(use-package pyim  :ensure t)


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


;; youdao-dict
(use-package youdao-dictionary
  :ensure t
  :config
  (setq youdao-dictionary-app-key "5f99312ee6462e1e")
  (setq youdao-dictionary-secret-key "g6u7hTZCpv4vYJ9PD5U0Rnr46N8kGZjl"))
;; Enable Cache
(setq url-automatic-caching t)
;; Example Key binding
(global-set-key (kbd "C-c 4") 'youdao-dictionary-search-from-input)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
;; Enable Chinese word segmentation support (支持中文分词)
(setq youdao-dictionary-use-chinese-word-segmentation t)


(defconst *is-a-mac* (eq system-type 'darwin))
(when *is-a-mac*
  (use-package exec-path-from-shell
    :ensure t)
  (exec-path-from-shell-initialize))


;; leetcode
(use-package leetcode
  :ensure t
  :config
  (setq leetcode-language "c++"))


;; type test
(use-package speed-type :ensure t)



(provide 'init-package)
;;; init-package.el ends here

