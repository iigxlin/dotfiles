(use-package evil
  :ensure t
  :hook (evil-org-mode . (lambda () (setq evil-want-C-i-jump nil)))
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil)
  :config
  (evil-set-leader 'normal ",")
  (setq evil-want-C-u-scroll t)
  (setq evil-want-fine-undo t)
  (evil-set-undo-system 'undo-tree)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
;  :custom (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(use-package evil-escape
  :after evil
  :config
  (evil-escape-mode)
  (setq-default
  evil-escape-key-sequence "jk"
  evil-escape-unordered-key-sequence t))

(provide 'init-evil-mode)
