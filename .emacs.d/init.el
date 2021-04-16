;; Set up package.el to work with MELPA
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))
(setq vc-follow-symlinks t)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))
(require 'use-package)
(setq use-package-always-ensure t)

(xterm-mouse-mode 1) ;; Enable mouse
(add-to-list 'load-path "~/.dotfiles/.emacs.d/modes/")

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t))
(set-face-attribute 'default nil :font "Monaco" :height 150)

(use-package which-key)
(use-package undo-tree
  :config
  (global-undo-tree-mode))

(require 'init-evil-mode)
(require 'init-org-mode)

;; ledger-mode
(use-package ledger-mode
  :config
    (add-to-list 'auto-mode-alist '("\\.journal$" . ledger-mode))
    (add-hook 'ledger-mode-hook
    (lambda ()
	(setq-local tab-always-indent 'complete)
	(setq-local completion-cycle-threshold t)
	(setq-local ledger-complete-in-steps t)))
    (setq ledger-highlight-xact-under-point nil))

;; Company Mode
(use-package company
  :hook ((after-init . global-company-mode)
	 (org-mode . (lambda () (company-mode -1)))
	 (ledger-mode . (lambda () (company-mode -1)))))

;; Projectile
(use-package projectile
  :config
  (setq projectile-cache-file (expand-file-name ".cache/projectile" user-emacs-directory))
  (projectile-mode 1)
  (evil-define-key 'normal projectile-mode-map
    (kbd "<leader>p") 'projectile-command-map))

(use-package counsel
  :after evil
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist
	'((t . ivy--regex-fuzzy)
	  (t . ivy--regex-plus)))
  (evil-define-key 'normal ivy-mode-map
    (kbd "<leader>fb") 'ivy-switch-buffer
    (kbd "<leader>fm") 'counsel-recentf))

(use-package vterm
  :config
  (setq vterm-kill-buffer-on-exit t))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5)
			  (registers . 5))))
