;;; init-cpp.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; code:


(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-ts-mode))


;; eglot config
(require 'eglot)
(add-to-list 'eglot-server-programs
	     '((c++-mode c-mode c++-ts-mode c-ts-mode)
	       "clangd"))
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)
(setq eglot-events-buffer-size 1)

;; switch between source & header
;; https://stackoverflow.com/questions/3509919/emacs-c-opening-corresponding-header-file
(add-hook 'c-ts-mode-hook
  (lambda()
    (local-set-key  (kbd "C-c C-o") 'ff-find-other-file)))
(add-hook 'c++-ts-mode-hook
  (lambda()
    (local-set-key  (kbd "C-c C-o") 'ff-find-other-file)))


;; cmake config
(use-package cmake-mode
  :ensure t
  :config
  (setq auto-mode-alist
	(append '(("CMakeLists\\.txt\\'" . cmake-mode)
                  ("\\.cmake\\'" . cmake-mode))
		auto-mode-alist)))
(use-package cmake-font-lock
  :ensure t)


;; flycheck support C++17
(require 'flycheck)
(add-hook 'prog-mode-hook
      (lambda ()
        (local-set-key (kbd "M-p") 'flycheck-previous-error)
	(local-set-key (kbd "M-n") 'flycheck-next-error)))
(add-hook 'c++-ts-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++17")))


(provide 'init-cpp)
;;; init-cpp.el ends here
