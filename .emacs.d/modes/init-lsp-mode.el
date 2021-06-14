(use-package lsp-mode
  :ensure t
  :hook
  ((go-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :config
  (evil-define-key 'normal lsp-mode-map
    (kbd "gd") 'lsp-find-definition
    (kbd "gr") 'lsp-find-references)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.git\\'"))

(provide 'init-lsp-mode)
