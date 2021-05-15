(use-package evil
  :ensure t
  :hook (evil-org-mode . (lambda () (setq evil-want-C-i-jump nil)))
  :init
  (setq evil-want-integration t
	evil-want-C-u-scroll t
	evil-wannt-fine-undo t
	evil-want-keybinding nil
	evil-disable-insert-state-bindings t)
  :config
  (evil-set-leader 'normal ",")
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
   evil-escape-delay 0.2
   evil-escape-key-sequence "jk"
   evil-escape-unordered-key-sequence t))

(use-package evil-easymotion
  :ensure t
  :after (evil avy)
  :config
  (evilem-default-keybindings "SPC"))

(provide 'init-evil-mode)
