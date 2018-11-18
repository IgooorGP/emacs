;; ;;;;
;; ;; Typescript
;; ;;;;

;; ;; Helper functions
(defun my-javadoc-return () 
  "Advanced C-m for Javadoc multiline comments.   
  Inserts `*' at the beggining of the new line if 
  unless return was pressed outside the comment"
  (interactive)
  (setq last (point))
  (setq is-inside
        (if (search-backward "*/" nil t)
        ;; there are some comment endings - search forward
            (search-forward "/*" last t)
          ;; it's the only comment - search backward
          (goto-char last)
          (search-backward "/*" nil t)
      )
    )
  ;; go to last char position
  (goto-char last)
  ;; the point is inside some comment, insert `* '
  (if is-inside
      (progn 
    (insert "\n* ")
    (indent-for-tab-command))
    ;; else insert only new-line
    (insert "\n")))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (electric-pair-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'js-mode-hook #'setup-tide-mode)

;; (add-hook 'js2-mode-hook (lambda () 
;;   (local-set-key "\r" 'my-javadoc-return)))


