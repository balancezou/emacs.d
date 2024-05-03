;; fold/toggle
(defun toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (or column
           (unless selective-display
             (1+ (current-column))))))

(defun toggle-hiding (column)
      (interactive "P")
      (if hs-minor-mode
          (if (condition-case nil
                  (hs-toggle-hiding)
                (error t))
              (hs-show-all))
        (toggle-selective-display column)))

(load-library "hideshow")
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'objc-mode-hook       'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'scheme-mode-hook     'hs-minor-mode)
(add-hook 'cmake-mode-hook      'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (overlay-put ov 'help-echo
                 (buffer-substring (overlay-start ov)
                                   (overlay-end ov)))))
(setq hs-set-up-overlay 'display-code-line-counts)

(provide 'init-hs)
