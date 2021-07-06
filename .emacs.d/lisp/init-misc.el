(setq tab-always-indent 'complete
      completion-cycle-threshold t)

(use-package recentf
  :ensure nil
  :config
  (add-hook 'after-init-hook 'recentf-mode)
  (setq-default
    recentf-max-saved-items 1024
    recentf-exclude `("/tmp/")))

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

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package avy
  :ensure t)

(use-package company
  :init
  (setq company-global-modes
	'(emacs-lisp-mode go-mode ledger-mode))
  :hook ((after-init . global-company-mode)))

(use-package projectile
  :init
    (evil-define-key 'normal projectile-mode-map
	(kbd "<leader>p") 'projectile-command-map)
  :config
  (setq projectile-cache-file (expand-file-name ".cache/projectile" user-emacs-directory))
  (projectile-mode 1))
