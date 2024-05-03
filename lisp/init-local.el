;; encoding
;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(setq utf-translate-cjk-mode nil) 
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

;; don't display startup face
(setq inhibit-startup-message t)

;; display line number & column number
(setq column-number-mode t)
(setq line-number-mode t)
(global-display-line-numbers-mode t)

;; kick off menubar & toolbar
(menu-bar-mode -1)
;;(tool-bar-mode -1)

;; set date\time display
(display-time)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; In every buffer, the line which contains the cursor 
;; will be fully highlighted
(global-hl-line-mode 1)

;; use clipboard
(setq x-select-enable-clipboard t)

;; matching pairs of parentheses
(show-paren-mode 1)

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; enable tramp
(require 'tramp)

;; display function name
(which-function-mode t)

;; automatic load abbreviations tables
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)

;; auto-load changed files
(global-auto-revert-mode 1)

;;-----------------------------------
;; config global key bindings here
;;-----------------------------------
;; Meta-g: goto line
(global-set-key (kbd "C-c g") 'goto-line)

;; open recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 100)
(global-set-key (kbd "C-c f") 'recentf-open-files)

;; open init file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c i") 'open-init-file)

;; backward delete word
(global-set-key (kbd "M-S-d") 'backward-kill-word)

(provide 'init-local)
