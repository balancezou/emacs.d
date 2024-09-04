;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; code:

;; Produce backtraces when errors occur,
;; can be helpful to diagnose startup issues
(setq debug-on-error t)

;; min version emacs29
(let ((minver "29.0"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

;; load site-lisp default path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Measure startup time
(require 'init-benchmarking)
(require 'init-local)
(require 'init-package)
(require 'init-org)
(require 'init-ide)
(require 'init-cpp)
(require 'init-python)
(require 'init-java)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(condition-case nil
    (load custom-file)
  (error nil))

(provide 'init)
;;; init.el ends here
