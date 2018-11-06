;;;;
;; Python
;;;;


;; Helper functions for Python development
(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
   Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun remove-last-dir (dir)
  ;; Removes last dir from a directory path.
  (string-match "\\(.*\\)/" dir)
  (match-string 1 dir))

(defun activate-venv-for-elpy()
  "Activates virtualenv for the elpy mode."
  (if (and (package-installed-p 'projectile) (file-directory-p (concat (remove-last-dir (directory-file-name (file-name-directory (projectile-project-root)))) "/.venv"))) (pyvenv-activate (concat (remove-last-dir (directory-file-name (file-name-directory (projectile-project-root)))) "/.venv")) (message "not .venv found!")))

;; Enables elpy for python development
(elpy-enable)

;; Removes annoying indentation highlighting
(delete 'elpy-module-highlight-indentation elpy-modules)

;; Activates virtualenv when elpy is launched
(add-hook 'elpy-mode-hook 'activate-venv-for-elpy)

;;;; After hook saves for Python:
;; 1. Black formats the code
;; 2. Runs isort to sort imports
;;;;
(add-hook 'after-save-hook (lambda () (when (bound-and-true-p elpy-mode) (shell-command (concat "black " buffer-file-name " --line-length=120")) (shell-command (concat "isort " buffer-file-name)))))
