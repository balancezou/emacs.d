;;; init-local.el --- basic config with build-in package -*- lexical-binding: t -*-
;;; Commentary:

;; basic config with build-in package

;;; code:


;; encoding
;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
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
;(global-display-line-numbers-mode t)

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
(setq select-enable-clipboard t)

;; matching pairs of parentheses
(show-paren-mode 1)

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; enable tramp
(require 'tramp)

;; automatic load abbreviations tables
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)

;; auto-load changed files
(global-auto-revert-mode 1)

;; auto save desktop
;; desktop will restore after restart emacs
(desktop-save-mode 1)

;; macosx -- meta config
(defconst *is-a-mac* (eq system-type 'darwin))
(when *is-a-mac*
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'none))


;; theme
(load-theme 'leuven-dark t)


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
  "Open init file in .emacs.d ."
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))
(global-set-key (kbd "C-c i") 'open-init-file)

;; open work list
(defun open-worklist-file()
  "Open work list org file."
  (interactive)
  (find-file "~/myfiles/worklist.org"))
(global-set-key (kbd "C-c w") 'open-worklist-file)


(provide 'init-local)
;;; init-local.el ends here
