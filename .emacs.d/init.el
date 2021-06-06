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

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

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
  :init
  (setq company-global-modes '(emacs-lisp-mode go-mode))
  :hook ((after-init . global-company-mode)))

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
	'((read-file-name-internal . ivy--regex-fuzzy)
	  (t . ivy--regex-plus)))
  (evil-define-key 'normal ivy-mode-map
    (kbd "<leader>fb") 'ivy-switch-buffer
    (kbd "<leader>fm") 'counsel-recentf))

(use-package vterm
  :config
  (setq vterm-kill-buffer-on-exit t))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown")
  (evil-define-key 'normal markdown-mode-map
    (kbd "<RET>") 'markdown-follow-link-at-point))

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

(use-package paredit
  :hook ((emacs-lisp-mode . enable-paredit-mode)
	 (lisp-mode . enable-paredit-mode)
	 (scheme-mode . enable-paredit-mode)))
