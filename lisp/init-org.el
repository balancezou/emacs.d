;;; init-org.el --- load org mode for node -*- lexical-binding: t -*-
;;; Commentary:

;; load org mode for node

;;; code:

;; org-babel for source block
(require 'ob-C)
;; load the languages that are needed
(org-babel-do-load-languages
'org-babel-load-languages '((C . t)))


;; org-roam
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/myfiles/doc/RoamNotes")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
	 ("C-c n a" . org-roam-alias-add)
	 ("C-c n o" . org-id-get-create)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))

(use-package websocket
  :ensure t
  :after org-roam)

(use-package org-roam-ui
  :ensure t
  :after org-roam
  ;; or :after org
  ;; normally we'd recommend hooking orui after org-roam,
  ;; but since org-roam does not have a hookable mode anymore,
  ;; you're advised to pick something yourself
  ;; if you don't care about startup time, use
  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))


;; insert image in org mode
(use-package org-download
  :ensure t
  :config
  (setq-default org-download-heading-lvl nil)
  (setq-default org-download-image-dir "./img")
  (setq org-download-backend "wget")
  (setq org-download-abbreviate-filename-function (lambda (fn) fn)) ; use original filename
  (defun dummy-org-download-annotate-function (link)
    "")
  (setq org-download-annotate-function
	#'dummy-org-download-annotate-function)
  )


;; plantuml
(use-package plantuml-mode :ensure t)
(setq org-plantuml-jar-path (expand-file-name "lisp/external/plantuml/plantuml-1.2024.5.jar" user-emacs-directory))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

(provide 'init-org)
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-org.el ends here
