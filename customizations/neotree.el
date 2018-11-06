;;;;
;; Neotree
;;;;
(add-to-list 'load-path "~/.emacs.d/elpa/neotree-20181104.1802")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle) 

;; customizes hidden files for neotree
(setq neo-hidden-regexp-list '("\\.pyc$" "__pycache__" ".git" ".vscode" ".db"))
(require 'all-the-icons)

;; displays icons if emacs is the graphic version
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Resizable neotree window
(setq neo-window-fixed-size nil)

;; Auto root changing
(global-set-key [f7] 'neotree-projectile-action)
