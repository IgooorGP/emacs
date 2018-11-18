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
  "Activates virtualenv for the elpy mode if projectile is installed (required) and if .venv directory exists."
  
  (let* ((venv-dir (concat (remove-last-dir (directory-file-name (file-name-directory (projectile-project-root)))) "/.venv")))
    (if (and (package-installed-p 'projectile) (file-directory-p venv-dir)) (pyvenv-activate venv-dir) (message "not .venv found!"))))


;; Enables elpy for python development
(elpy-enable)

;; Removes annoying indentation highlighting
(delete 'elpy-module-highlight-indentation elpy-modules)

;; Activates virtualenv when elpy is launched
(add-hook 'elpy-mode-hook 'activate-venv-for-elpy)

;;;; After hook for saving Python code (after the save, we format and update the buffer with the changed version)
(add-hook 'after-save-hook (lambda () (when (bound-and-true-p elpy-mode)
  (shell-command (concat "black " buffer-file-name " --line-length=80") "black buffer" "black error buffer") ;; runs black to format code
  (shell-command (concat "isort " buffer-file-name) "isort buffer" "isort error buffer")  ;; runs isort to sort the imports
  (revert-buffer :ignore-auto :noconfirm))))  ;; updates the current buffer

