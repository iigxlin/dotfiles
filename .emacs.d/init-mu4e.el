(use-package mu4e
  :ensure nil
  :config
  (setq mail-user-agent 'mu4e-user-agent)
  (setq
   message-send-mail-function 'smtpmail-send-it
   smtpmail-default-smtp-server "smtp.gmail.com"
   smtpmail-smtp-server "smtp.gmail.com"
   smtpmail-local-domain "gmail.com")
  (setq mu4e-use-fancy-chars t)
  (setq mu4e-attachment-dir "~/Downloads/")
  (setq mu4e-view-show-images t)
  ; (setq mu4e-get-mail-command "offlineimap"
	;   mu4e-update-interval 300)
  (setq mu4e-index-cleanup nil
	mu4e-index-lazy-check t)

  (setq mu4e-contexts
	`( ,(make-mu4e-context
	     :name "Gmail"
	     :match-func (lambda (msg)
			   (when msg
			     (string-prefix-p "/Gmail" (mu4e-message-field msg :maildir))))
	     :vars '(
		     (mu4e-trash-folder . "/Gmail/[Gmail].Bin")
		     (mu4e-refile-folder . "/Gmail/[Gmail].All Mail")
		     (mu4e-sent-folder . "/Gmail/[Gmail].Sent Mail")
		     (mu4e-drafts-folder . "/Gmail/[Gmail].Drafts")))))
  (add-to-list 'mu4e-view-actions '("View in Browser" . mu4e-action-view-in-browser) t)
  (evil-define-key 'normal 'global
    (kbd "<leader>m") 'mu4e))

(provide 'init-mu4e)
