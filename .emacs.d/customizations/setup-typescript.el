;;;;
;; Typescript
;;;;

;; Helper functions
(defun setup-tide-mode ()
  ;; Setups tide mode
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

;; Adds setup when typescript mode is on
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; Pair mode completion
(electric-pair-mode t)
