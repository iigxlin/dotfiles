(use-package org
  :after evil
  :config
  (setq org-directory "~/notes/")
  (setq org-default-notes-file (concat org-directory "/inbox.org"))
  (setq org-capture-templates
	'(("t" "TODO" entry (file+headline org-default-notes-file "Tasks")
	   "* TODO %?\nCaptured on %U\n  %i\n  %a")
	  ("j" "Journal" entry (file+datetree org-default-notes-file)
	   "* %?\nCaptured on %U\n  %i\n  %a")))
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
; (setq org-agenda-files (directory-files-recursively "~/notes/" "\\.org$"))
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (setq org-agenda-start-on-weekday 0)
  (setq org-adapt-indentation nil)
  (setq org-return-follows-link t)
  (setq org-log-done t)
  (evil-define-key 'normal 'global
    (kbd "<leader>a") 'org-agenda
    (kbd "<leader>l") 'org-store-link
    (kbd "<leader>c") 'org-capture)
  (evil-define-key 'normal org-mode-map
    (kbd "TAB") 'org-cycle
    (kbd "RET") 'org-open-at-point)

  (setq org-todo-keywords
	'((sequence "TODO" "|" "DONE" "CANCELED")))
  (setq org-tag-alist '((:startgroup . nil)
			("work" . ?w) ("home" . ?h) ("errants" . ?e)
			(:endgroup . nil)
			("@phone" . ?p)))

  (setq org-icalendar-include-todo t)
  (setq org-icalendar-combined-agenda-file "~/notes/org.ics")
  (add-hook 'org-mode-hook
    (lambda ()
	(add-hook 'after-save-hook 'org-icalendar-combine-agenda-files nil t))))

(use-package evil-org
  :ensure t
  :after (org evil)
  :hook (org-mode . (lambda () (evil-org-mode)))
		      
  :config
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar todo))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(provide 'init-org-mode)
