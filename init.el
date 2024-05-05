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
;; init common config
(require 'init-local)
;; init package
(require 'init-package)
;; init code basic config as ide
(require 'init-ide)
;; init cpp
(require 'init-cpp)
;; init java
;(require 'init-java)

(provide 'init)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
