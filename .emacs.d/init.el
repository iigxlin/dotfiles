;; Make startup faster by reducing frequency of garbage collection.
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)
;; Make gc pauses faster by decreasing the threhold to 8 MiB (default is
;; 800kB)
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold (expt 2 23))))

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
(setq-default fill-column 72)
(menu-bar-mode -1)

(setq recentf-max-saved-items 100)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))
(require 'use-package)
(setq use-package-always-ensure t)

(xterm-mouse-mode 1) ;; Enable mouse
(add-to-list 'load-path "~/.dotfiles/.emacs.d/")
(add-to-list 'load-path "~/.dotfiles/.emacs.d/modes/")

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t))
(set-face-attribute 'default nil :font "Monaco" :height 150)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(require 'init-evil-mode)
(require 'init-org-mode)
(require 'init-lsp-mode)
(require 'init-mu4e)

(use-package ledger-mode
  :mode (("\\.journal$" . ledger-mode))
  :config
  (add-hook 'ledger-mode-hook
    (setq-local tab-always-indent 'complete)
    (setq-local completion-cycle-threshold t)))

;; Company Mode
(use-package company
  :init
  (setq company-global-modes
	'(emacs-lisp-mode go-mode ledger-mode))
  :hook ((after-init . global-company-mode)))

;; Projectile
(use-package projectile
  :init
    (evil-define-key 'normal projectile-mode-map
	(kbd "<leader>p") 'projectile-command-map)
  :config
  (setq projectile-cache-file (expand-file-name ".cache/projectile" user-emacs-directory))
  (projectile-mode 1))

(use-package counsel
  :after evil
  :init
  (evil-define-key 'normal ivy-mode-map
    (kbd "<leader>fb") 'ivy-switch-buffer
    (kbd "<leader>fm") 'counsel-recentf)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist
	'((read-file-name-internal . ivy--regex-fuzzy)
	  (t . ivy--regex-plus))))

(use-package vterm
  :commands (vterm)
  :config
  (setq vterm-kill-buffer-on-exit t))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init
  (evil-define-key 'normal markdown-mode-map
    (kbd "<RET>") 'markdown-follow-link-at-point)
  (setq markdown-command "multimarkdown"))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package go-mode
  :ensure t
  :commands (go-mode)
  :mode (("\\.go\\'" . go-mode))
  :hook ((go-mode . (lambda () (setq tab-width 4)))))

(use-package avy)

(use-package esup
  :ensure t
  :pin melpa)
