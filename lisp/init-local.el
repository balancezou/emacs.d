;; load site-lisp default path
(add-to-list 'load-path "~/.emacs.d/site-lisp")

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

;; englisg font
(set-frame-font "monospace 10")

;; display line number & column number
(setq column-number-mode t)
(setq line-number-mode t)

;; kick off menubar & toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; set date\time display
(setq display-time-day-and-date t)
(display-time)

;; you know
(fset 'yes-or-no-p 'y-or-n-p)

;; display image
(auto-image-file-mode t) 

;; automatic load abbreviations tables
(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)

;; In every buffer, the line which contains the cursor 
;; will be fully highlighted
(global-hl-line-mode 1)

;; use clipboard
(setq x-select-enable-clipboard t)

;; use clipboard
(setq x-select-enable-clipboard t)

(setq visible-bell t)
(setq  scroll-margin 2
       scroll-conservatively 10000)
(setq kill-ring-max 200)
(setq transient-mark-mode t)

;; matching pairs of parentheses
(show-paren-mode 1)

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

;; indent
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq-default c-basic-offset 4)
(setq c-default-style "linux"
      c-basic-offset 4)
(c-set-offset 'substatement-open 0)

;; display function name
(which-function-mode t)

;; display weekly calender
(copy-face font-lock-constant-face 'calendar-iso-week-face)
(set-face-attribute 'calendar-iso-week-face nil
                      :height 0.5 :foreground "salmon")
(setq calendar-intermonth-text
      '(propertize
        (format "W%02d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'calendar-iso-week-face))

(provide 'init-local)
