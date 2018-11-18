;;;;
;; Javascript 
;;;;

;; (add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
;; (add-hook 'js-mode-hook 'subword-mode)
;; (add-hook 'html-mode-hook 'subword-mode)
;; (setq js-indent-level 2)
;; (eval-after-load "sgml-mode"
;;   '(progn
;;      (require 'tagedit)
;;      (tagedit-add-paredit-like-keybindings)
;;      (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))


;; ;; coffeescript
;; (add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
;; (add-hook 'coffee-mode-hook 'subword-mode)
;; (add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
;; (add-hook 'coffee-mode-hook
;;           (defun coffee-mode-newline-and-indent ()
;;             (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
;;             (setq coffee-cleanup-whitespace nil)))
;; (custom-set-variables
;;  '(coffee-tab-width 2))

;; Helper functions
;; (require 'js2-mode)
;; (require 'flycheck)

;; (defun my-javadoc-return () 
;;   "Advanced C-m for Javadoc multiline comments.   
;;   Inserts `*' at the beggining of the new line if 
;;   unless return was pressed outside the comment"
;;   (interactive)
;;   (setq last (point))
;;   (setq is-inside
;;         (if (search-backward "*/" nil t)
;;         ;; there are some comment endings - search forward
;;             (search-forward "/*" last t)
;;           ;; it's the only comment - search backward
;;           (goto-char last)
;;           (search-backward "/*" nil t)
;;       )
;;     )
;;   ;; go to last char position
;;   (goto-char last)
;;   ;; the point is inside some comment, insert `* '
;;   (if is-inside
;;       (progn 
;;     (insert "\n* ")
;;     (indent-for-tab-command))
;;     ;; else insert only new-line
;;     (insert "\n")))

;; (add-hook 'js2-mode-hook (lambda () 
;;   (local-set-key "\r" 'my-javadoc-return)))

;; ;; Adds js2-mode to the given extension
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; (defun setup-js2-mode()
;;   ;; Configures j2-mode

;;   ;; use eslint with web-mode for jsx files
;;   (flycheck-add-mode 'javascript-eslint 'web-mode)

;;   ;; Pair mode completion
;;   (electric-pair-mode t)
  
;;   ;; Company-mode
;;   (company-mode +1)

;;   ;; Flycheck lint
;;   (flycheck-mode +1))

;; ;; Adds the config hook for js2-mode
;; (add-hook 'js2-mode-hook #'setup-js2-mode)
