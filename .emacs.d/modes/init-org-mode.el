(use-package org
  :after evil
  :commands org-agenda
  :config
  (require 'org-tempo)
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
  (setq org-descriptive-links nil)
  (evil-define-key 'normal 'global
    (kbd "<leader>a") 'org-agenda
    (kbd "<leader>l") 'org-store-link
    (kbd "<leader>c") 'org-capture)
  (evil-define-key 'normal org-mode-map
    (kbd "TAB") 'org-cycle
    (kbd "RET") 'org-open-at-point)

  ;; todo
  (setq org-todo-keywords
	'((sequence "TODO" "NEXT" "WAITING" "SOMEDAY" "PROJECT" "|" "DONE" "CANCELED")))
  (setq org-log-done t)

  ;; tags
  (setq org-tag-alist '((:startgroup . nil)
			("work" . ?w) ("home" . ?h) ("errants" . ?e)
			(:endgroup . nil)
			("@phone" . ?p)))

  ;; org babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t))))

(use-package org-agenda
  :ensure nil
  :init
  (setq org-agenda-dim-blocked-tasks nil)
  (setq org-agenda-skip-deadline-prewarning-if-scheduled t)
  (setq org-deadline-warning-days 10)
  (setq org-agenda-compact-blocks t)
  (setq org-agenda-custom-commands
	'(("d" "Daily agenda and all TODOs"
	   ((tags "PRIORITY=\"A\""
		  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
		   (org-agenda-overriding-header "High-priority unfinished tasks:")))
	    (agenda "" ((org-agenda-ndays-to-span 1)))
	    (alltodo ""
		     ((org-agenda-skip-function '(or (org-agenda-skip-if nil '(scheduled deadline))))
		      (org-agenda-overriding-header "All normal priority tasks:"))))))))


(use-package evil-org
  :ensure t
  :after (org evil)
  :hook (org-mode . (lambda () (evil-org-mode)))
  :config
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar todo))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  (evil-define-key 'motion org-agenda-mode-map
    (kbd "q") (lambda ()
		(interactive)
		(org-save-all-org-buffers)
		(org-agenda-quit))))

(provide 'init-org-mode)
