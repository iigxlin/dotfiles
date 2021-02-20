;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
	                  '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(auto-complete ledger-mode evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Evil
(unless (package-installed-p 'evil)
    (package-install 'evil))
(require 'evil)
(evil-mode 1)

;; Org Mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

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
