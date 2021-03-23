;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))
(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-escape counsel evil-org paredit auto-complete ledger-mode evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(xterm-mouse-mode 1) ;; Enable mouse

;; Evil
(unless (package-installed-p 'evil)
    (package-install 'evil))
(require 'evil)
(evil-mode 1)
(evil-set-leader 'normal ",")

;; Evil escape
(unless (package-installed-p 'evil-escape)
    (package-install 'evil-escape))
(require 'evil-escape)
(evil-escape-mode)
(setq-default
 evil-escape-key-sequence "jk"
 evil-escape-unordered-key-sequence t)

;; Org Mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(use-package evil-org
	     :ensure t
	     :after org
	     :hook (org-mode . (lambda () evil-org-mode))
	     :config
	     (require 'evil-org-agenda)
	     (evil-org-agenda-set-keys))

;; ledger-mode
(unless (package-installed-p 'ledger-mode)
  (package-install 'ledger-mode))
(require 'ledger-mode)
(add-to-list 'auto-mode-alist '("\\.journal$" . ledger-mode))
(add-hook 'ledger-mode-hook
  (lambda ()
    (setq-local tab-always-indent 'complete)
    (setq-local completion-cycle-threshold t)
    (setq-local ledger-complete-in-steps t)))
(setq ledger-highlight-xact-under-point nil)

;; Auto-Complete
(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))
(require 'auto-complete)
(ac-config-default)

;; Par Edit
(unless (package-installed-p 'paredit)
  (package-install 'paredit))
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))

;; Counsel
(unless (package-installed-p 'counsel)
  (package-install 'counsel))
(ivy-mode)
(setq ivy-use-virutal-buffers t)
(setq enable-recursive-minibuffers t)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'counsel-find-file)
(evil-define-key 'normal 'global (kbd "go") 'counsel-git-grep)
