;; load site-lisp default path
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; set date\time display
(setq display-time-day-and-date t)
(display-time)

;; you know
(fset 'yes-or-no-p 'y-or-n-p)

;; kick off menubar & toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; use clipboard
(setq x-select-enable-clipboard t)

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; Color Theme
;(add-to-list 'load-path "~/.emacs.d/config/color-theme-6.6.0")
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-emacs-nw)
;(color-theme-feng-shui)
;; 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (manoj-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; Meta-g: goto line
(global-set-key (kbd "M-g") 'goto-line)

;; open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 100)
(global-set-key (kbd "C-c C-f") 'recentf-open-files)

;; tramp
(require 'tramp)

;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; indent
(setq-default c-basic-offset 8)
(setq c-default-style "linux"
      c-basic-offset 8)
(c-set-offset 'substatement-open 0)

;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; display function name
(which-function-mode t)

;; gtags
;;start Emacs and execute gtags-mode function.
(autoload 'gtags-mode "gtags" "" t)
(setq c-mode-hook
      '(lambda ()
	      (gtags-mode 1)))

;; eim
(add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(autoload 'eim-use-package "eim" "Another emacs input method")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" "py.txt")
;; 用 ; 暂时输入英文
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)


;; stardict
(require 'stardict)
(global-set-key (kbd "<M-f1>") 'view-stardict-in-buffer)
