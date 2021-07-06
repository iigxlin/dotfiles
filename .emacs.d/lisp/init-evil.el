(use-package evil
  :ensure t
  :hook ((evil-org-mode . (lambda () (setq evil-want-C-i-jump nil)))
	 (after-init . (lambda () (evil-mode 1))))
  :init
  (setq evil-want-integration t
	evil-want-C-u-scroll t
	evil-wannt-fine-undo t
	evil-want-keybinding nil
	evil-disable-insert-state-bindings t)
  :config
  (evil-set-leader 'normal ",")
  (evil-set-undo-system 'undo-tree))

(use-package evil-collection
  :after evil
  :ensure t
; :custom (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(use-package evil-easymotion
  :ensure t
  :after (evil avy)
  :config
  (evilem-default-keybindings "SPC"))

(provide 'init-evil)
