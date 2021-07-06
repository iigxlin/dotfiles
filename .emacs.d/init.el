;; -*- coding: utf-8; lexical-binding: t; -*-

;; Make startup faster by reducing frequency of garbage collection.
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)
;; Make gc pauses faster by decreasing the threhold to 8 MiB (default is
;; 800kB)
(add-hook 'emacs-startup-hook
	  (lambda () (setq gc-cons-threshold (expt 2 23))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))
(setq vc-follow-symlinks t)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(setq-default fill-column 72)
(menu-bar-mode -1)
(xterm-mouse-mode 1) ;; Enable mouse

(require 'init-package)

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

(require 'init-evil)
(require 'init-org)
(require 'init-mu4e)
(require 'init-lang)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-local nil t)
