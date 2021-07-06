(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))
(require 'use-package)
(setq use-package-always-ensure t)

(provide 'init-package)
