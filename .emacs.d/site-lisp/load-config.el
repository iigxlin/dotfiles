(defun load-config (filename &optional dirname)
  (unless dirname (setq dirname "~/.dotfiles/.emacs.d/"))
  (load (concat dirname (symbol-name filename)) 'noerror))

(defun load-mode (modename)
  (load-config modename "~/.dotfiles/.emacs.d/modes/"))
